component extends="testbox.system.BaseSpec" {

    function run() {
        describe("Billing System Tests", function() {

            it("should insert tax details successfully", function() {
                var taxDetails = {
                    tax_amount = 18.5,
                    status = "active",
                    Control_ID = 101
                };
                var result = component.inserttax(
                    taxDetails.tax_amount,
                    taxDetails.status,
                    taxDetails.Control_ID
                );
                expect(result).notToBeNull();
            });
        });
    }
}
