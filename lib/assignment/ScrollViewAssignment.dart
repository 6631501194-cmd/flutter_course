import 'package:flutter/material.dart';

class ScrollViewAssignment extends StatelessWidget {
  const ScrollViewAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // TOP FIXED TITLE
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ScrollView Demo",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // MIDDLE SCROLLABLE BOX
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5EFF8), // light purple background
                    border: Border.all(color: Colors.black, width: 1.2),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // title inside the box
                        Text(
                          "GNU General Public License v3",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "Disclaimer of Warranty.",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. "
                          "EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES "
                          "PROVIDE THE PROGRAM \"AS IS\" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR "
                          "IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY "
                          "AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND "
                          "PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, "
                          "YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.",
                          style: TextStyle(fontSize: 15, height: 1.5),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "Limitation of Liability.",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT "
                          "HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS PERMITTED ABOVE, "
                          "BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR "
                          "CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM "
                          "(INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR "
                          "LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH "
                          "ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE "
                          "POSSIBILITY OF SUCH DAMAGES.",
                          style: TextStyle(fontSize: 15, height: 1.5),
                        ),

                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // BOTTOM FIXED BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 130,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: Text("REJECT",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),

                  SizedBox(width: 20),

                  SizedBox(
                    width: 130,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: Text("AGREE",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
