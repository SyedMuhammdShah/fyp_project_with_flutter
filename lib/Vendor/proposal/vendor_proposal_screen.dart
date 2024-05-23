import 'package:flutter/material.dart';
import 'package:fyp_project/Vendor/proposal/show_proposal_class.dart';

class VendorProposalScreen extends StatefulWidget {
  const VendorProposalScreen({super.key});

  @override
  State<VendorProposalScreen> createState() => _VendorProposalScreenState();
}

class _VendorProposalScreenState extends State<VendorProposalScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Proposal"),
      ),
      body: Container(
        child: ProposalShowScreen(),
      ),
    );
  }
}