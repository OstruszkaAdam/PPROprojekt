"use strict";

document.addEventListener("DOMContentLoaded", function () {
    var cy = cytoscape({
        container: document.getElementById('cy'),

        elements: GraphElements,

        style: [
            {
                selector: 'node',
                style: {
                    'background-color': [0, 150, 136],
                    label: 'data(id)'
                }

            }],

        layout: {
            name: 'circle',
            circle: function (node) {
                return node.degree();
            }

        }

    });

    /*zamkne graf proti manipulaci*/
    /*cy.autolock(true);*/










/*    function panIn(target) {
        cy.animate({
            fit: {
                eles: target,
                padding: 200
            },
            duration: 700,
            easing: 'ease',
            queue: true
        });
    }

    function findSuccessor(selected) {
        var connectedNodes;
        if (selected.isEdge()) {
            connectedNodes = selected.target();
        } else {
            connectedNodes = selected.outgoers().nodes();
        }
        var successor = connectedNodes.max(function (ele) {
            return Number(ele.id());
            // Need to use Number; otherwise, id() provide string
            // which messes up comparison (says that "10" < "9")

            // max returns object with value and ele
        });
        return successor.ele;
    }

    function advanceByButton(previous) {
        // unselecting is not strictly necessary since cy defaults to single selection
        previous.unselect();
        var nextSelect = findSuccessor(previous);
        if (previous.id() === cy.nodes('#10').id()) {
            // loop back to beginning instead of repeating pyruvate
            nextSelect = cy.nodes('#0');
        }
        nextSelect.select();
        panIn(nextSelect);
    }

    var advanceButton = document.getElementById('advance');
    advanceButton.addEventListener('click', function () {
        var previous = cy.$(':selected');
        advanceByButton(previous);
    });

    cy.on('tap', 'node', function (event) {
        // acts as advanceByButton for manually selected nodes
        var target = event.cyTarget;
        cy.nodes().unselect();
        target.select();
        panIn(target);
        // open Wikipedia for node info
        window.open(target.data('url'));
    });

    // Initialization: select first element to focus on.
    var startNode = cy.$('node[molecule = "Glucose"]');
    startNode.select();
   /!* panIn(startNode);*!/

   */
});
