const db = require("../data/db-config");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return db("schemes")
}

function findById (id) {
    return db("schemes")
            .where({id})
            .first();

}

function findSteps(id) {
    return db("steps as st")
            .join("schemes as sc", "sc.id", "st.scheme_id")
            .select( "st.id", "sc.scheme_name", "st.step_number", "st.instructions")
            .where({scheme_id: id})
            .orderBy("st.step_number");
}

function add(newScheme) {
    return db("schemes")
            .insert(newScheme)
            .then(newId => {
                return findById(newId);
            })
}

function update(changes, id) {
    return db("schemes")
            .where({id: id})
            .update(changes)
            .then(updated => {
                return findById(id);
            })
}

async function remove(id) {
    const deletedScheme = await findById(id);
    return db("schemes")
            .where({id})
            .del()
            .then(del => {
                return deletedScheme;
            })
}

