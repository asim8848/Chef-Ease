

const express = require('express');
const chefController = require('../controllers/chefController');

const router = express.Router();

router.post('/', chefController.createChef);
router.get('/', chefController.getAllChefs);
router.patch('/firebase/:firebaseId', chefController.updateChef);
router.get('/firebase/:firebaseId', chefController.getChefByFirebaseId);
router.delete('/firebase/:firebaseId', chefController.deleteChef);

module.exports = router;




/*
const express = require('express');
const chefController = require('../controllers/chefController');

const router = express.Router();

router.post('/', chefController.createChef);
router.get('/', chefController.getAllChefs);
router.get('/:id', chefController.getChef);
router.put('/:id', chefController.updateChef);
router.delete('/:id', chefController.deleteChef);

module.exports = router;*/
