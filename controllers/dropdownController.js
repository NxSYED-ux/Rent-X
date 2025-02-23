const DropdownTypes = require("../models/DropdownTypes");
const DropdownValues = require("../models/DropdownValues");

const getDropdownValuesByType = async (req, res) => {
    try {
        const name = req.params?.type;
        if (!name) {
            return res.status(400).json({ error: "Name is required" });
        }
        
        const data = await DropdownTypes.findAll({
            where: { type_name: name },
            attributes: [ ],
            include: [
                {
                    model: DropdownValues,
                    as: 'values',
                    attributes: ['value_name'],
                },
            ],
        });
        
        if (!data.length) {
            return res.status(404).json({ error: `No values found against type ${name}` });
        }
        const valuesOnly = data.flatMap(type => type.values.map(v => v.value_name));
        res.status(200).json({ values: valuesOnly });
    } catch (error) {
        console.error("Error in getDropdownValuesByType:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};

const getDropdownValuesByValue = async (req, res) => {
    try {
        const name = req.params?.value;
        if (!name) {
            return res.status(400).json({ error: "Name is required" });
        }
        
        const data = await DropdownValues.findAll({
            where: { value_name: name },
            attributes: [ ],
            include: [
                {
                    model: DropdownValues,
                    as: 'childs',
                    attributes: ['value_name'],
                },
            ],
        });
        
        if (!data.length) {
            return res.status(404).json({ error: `No values found against ${name}` });
        }
        const valuesOnly = data.flatMap(type => type.childs.map(v => v.value_name));
        res.status(200).json({ values: valuesOnly });
    } catch (e) {
        console.error("Error in getDropdownValuesByValue:", e);
        res.status(500).json({ error: "Internal server error" });
    }
};

module.exports = { getDropdownValuesByType, getDropdownValuesByValue };
