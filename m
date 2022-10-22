Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269717B
	for <linux-coco@lists.linux.dev>; Sat, 22 Oct 2022 03:20:22 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29M3CAbW006700;
	Sat, 22 Oct 2022 03:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : from :
 reply-to : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding : subject; s=pp1;
 bh=4R9GB6YCkT1oBASyU3cygK9F0xQbxEvrOoeamzeenoI=;
 b=G3tfjnBGTAlaJMLrF4iVfpnaMw//ZpqLVy9IrXQdY5KSgiEJnMzyX2+MWukyrFLq7pBi
 jowYtGX+DEeVLwVwXXGlRoBG/0wW7bG2QJ8UKu/nKkEcXIduS8jHmnZcmawbYavScNE2
 ijRQ+LoiprIHaduyCecb7TILRXDEmdSNvlGPhiJg45WNMSHXjPisWlXnIOO/0ceaGCWk
 /UVhJeB0svT/h3HGoylKVGBiKaMZDLeVLkn6fDnz3C2UNsNf3FaLV/RHGz6KewAYlM+v
 ++s/fevOmYjGUnUoe9bHU0c2iOMOyWI5RlS0gcv1O4CJEbw5tavaE9g8n7o+3RlmK1l4 Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kc8d9g4f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Oct 2022 03:20:21 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29M3KLGx017189;
	Sat, 22 Oct 2022 03:20:21 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kc8d9g4en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Oct 2022 03:20:21 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29M350Qp026745;
	Sat, 22 Oct 2022 03:20:20 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma04wdc.us.ibm.com with ESMTP id 3kc85980vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Oct 2022 03:20:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29M3KHkd44564880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Oct 2022 03:20:17 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF44B7805E;
	Sat, 22 Oct 2022 04:01:26 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C08977805C;
	Sat, 22 Oct 2022 04:01:25 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Sat, 22 Oct 2022 04:01:25 +0000 (GMT)
Message-ID: <7ccb703338c8a1b2287b442864e1249054bf3cc1.camel@linux.ibm.com>
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Jon Lange <jlange@microsoft.com>,
        David Altobelli
	 <David.Altobelli@microsoft.com>,
        Steve Rutherford <srutherford@google.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        Christophe de Dinechin <cdupontd@redhat.com>,
        "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com"
 <amd-sev-snp@lists.suse.com>
Date: Fri, 21 Oct 2022 23:20:16 -0400
In-Reply-To: <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
	 <Y0b6cDIMlKijT95S@work-vm>
	 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
	 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
	 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
	 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
	 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
	 <Y0+wcWgcRFTiDTNk@redhat.com>
	 <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
	 <Y0/2D93P/xgp1sU9@redhat.com>
	 <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
	 <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
	 <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
	 <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
	 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
	 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
	 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
	 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
	 <7e67f33577aaebe09205c9a93597de9f742fd08f.camel@linux.ibm.com>
	 <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QP6DoQkDJEg6LlS4Lba3JsB8J65HNeSI
X-Proofpoint-ORIG-GUID: roltJiYqzFssejGlfvndyZGAae_2vki5
Subject: RE: SVSM vTPM specification
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=739 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210220017

On Fri, 2022-10-21 at 16:31 +0000, Jon Lange wrote:
> The drawback to having an identifier-prefixed document is that it
> necessarily restricts each report to providing only a single
> statement from a single SVSM protocol.

Actually, it doesn't.  Nothing prevents a particular type being
multiplexed (although if that happens the report for this particular
type is no-longer self describing).

>   If, in the future, we find it is common for a relying party to
> require, say, five different protocol statements, this imposes a
> requirement to obtain five separate reports.  This means a minimum of
> five round trips from the SVSM to the PSP, which seems
> undesirable.  I think we will really want to invest in defining an
> extensible format that can be placed into a single report.  I'm not
> claiming that JSON is the only option here, but I think we will
> regret any format that prevents extension within a single report.

If this becomes a future problem, we can by all means define a
multiplexed type.  However, absent knowledge that it is a real problem,
I'd like to begin with a simply defined format for the vTPM report plus
room for expansion (the type prefix).

> I'm having a hard time understanding any scenario that involves an
> entity that has access both to an SNP report and the vTPM and which
> also needs to verify the report.  If the objective is for the guest
> (which has access to the vTPM) to obtain the TPM's endorsement key,
> then it could obtain it directly via the vTPM protocol without
> requiring the SNP report.

To my way of thinking, the attestation report proves the binding of a
given vTPM to the SVSM of a given confidential enclave.  I believe this
is required before any relying party can use the TPM and rely on its
measurements. 


>   After all, the vTPM SVSM protocol does not need to be limited to
> providing exactly the functionality of the vTPM command set, but can
> also include other utilities that are useful to the guest.

I think ideally the vTPM should behave like a real TPM.  I agree we
could use extension commands to multiplex SVSM commands over the TPM
interface, but then the standardisation question becomes how?  We could
elect to document these commands in the SVSM interface and hope no-one
tramples on them or go to the TCG and hope to standardise them that
way, but the easiest thing to do is to use the SVSM document to
standardise an SVSM interface to this instead of a TPM one.  Providing
a SVSM interface doesn't preclude providing a TCG extension interface,
so if it's useful (say TDX comes on board) then we can do it later
after we've proven the value with the SVSM interface.

>   If the objective is for an external party to obtain information
> about the vTPM, then it doesn't have access to the vTPM anyway and
> will have to rely solely on what's in the report.  If the vTPM
> endorsement key is rooted to a well-known certificate, then the TPM
> certificate can be provided directly by the guest without relying on
> any SNP report (in exactly the same way that physical TPMs do not
> rely on a separate hardware root of trust to authenticate them).

A TPM certificate can only be trusted if you trust the manufacturing
process of the TPM.  This is fairly well defined for physical TPMs and
known (and regulated) manufacturers, but doesn't really work for pure
software TPMs.

>   Can you shed some light on scenarios in which you think the guest
> has no choice but to compare the SNP report and the vTPM state to
> verify that they match?

An Ephemeral vTPM: the SNP PreAttestation report confirms the code for
the SVSM and OVMF, so you need the OVMF measurements to prove the
kernel, inird and command line and the optional runtime measurements. 
If we get this right the vTPM will provide those measurement, but as a
pre-requisite to relying on those measurements, you need proof that the
vTPM you're relying on is the one within your confidential envelope. 
That's what the report provides by confirming the EK of the ephemeral
vTPM.

James


