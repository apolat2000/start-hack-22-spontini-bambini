const generalService = require("../general/general.service");
const { DICTIONARY } = require("../general/general.models");
const PDFDocument = require("pdfkit");

const {
  User,
  Event,
  Organization,
  UserDB,
  EventDB,
  OrganizationDB,
} = require("../general/general.models");

const generateCertificateAction = async (req, res) => {
  const userId = req.body.user_id;
  const organizationId = req.body.organization_id;

  const allEvents = (
    await generalService.selectAllEventsByIssuerAndTarget({
      issuerId: userId,
      targetId: organizationId,
    })
  ).map((e) => new Event(e));

  const organization = new Organization(
    await generalService.selectOrganizationById({ organizationId })
  );

  const organizationTags = await generalService.selectAllTagsOfOrganization({
    organizationId,
  });

  // Create a document
  const doc = new PDFDocument({ bufferPages: true });

  let buffers = [];

  doc.on("data", buffers.push.bind(buffers));
  doc.on("end", () => {
    let pdfData = Buffer.concat(buffers);
    res
      .writeHead(200, {
        "Content-Length": Buffer.byteLength(pdfData),
        "Content-Type": "application/pdf",
        "Content-disposition": "attachment;filename=test.pdf",
      })
      .end(pdfData);
  });

  // If not commented out, the next line saves the pdf in the file system.
  // doc.pipe(fs.createWriteStream("output.pdf"));

  // Embed a font, set the font size, and render some text
  doc.font("static/PalatinoBold.ttf");
  doc.fontSize(25);
  doc.text(`Certificate of experience at`, 50, 50, { align: "center" });
  doc.fontSize(12);
  doc.moveDown().font("static/PalatinoBoldItalic.ttf");
  doc.fontSize(25);
  doc.text(organization.name, { align: "center" });

  // Add an image, constrain it to a given size, and center it vertically and horizontally
  doc.image("static/logo.png", 487.28, 663.89, {
    fit: [128, 128],
  });

  doc.image("static/switchLogo.png", 10, 728.89, {
    fit: [226.5, 57],
  });

  doc.fontSize(16);
  doc.moveDown();
  doc.moveDown();
  doc.moveDown();

  for (const event of allEvents) {
    console.log({ timestamp: event.timestamp });
    if (
      event.type !== DICTIONARY.eventTypes.startSuspend &&
      event.type !== DICTIONARY.eventTypes.stopSuspend
    ) {
      doc.text(DICTIONARY.prettyEventTypes[event.type], {
        align: "left",
      });
      if (event.type === DICTIONARY.eventTypes.newRole) {
        doc.text(
          `${event.payload.role} at ${event.payload.department} deparment`,
          {
            align: "left",
          }
        );
      }
      doc.text(new Date(Number(event.timestamp)).toLocaleDateString(), {
        align: "right",
      });
      doc.moveDown();
      doc.moveDown();
    }
  }

  // Finalize PDF file
  doc.end();
};

const listOrganizationsAction = async (req, res) => {
  const userId = req.body.user_id;

  const allOrganizations = await generalService.selectAllOrganizationsByUserId({
    userId,
  });

  res.json({ msg: "ok", data: allOrganizations });
};

module.exports = { generateCertificateAction, listOrganizationsAction };
