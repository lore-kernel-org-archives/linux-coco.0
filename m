Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2EC28E7
	for <linux-coco@lists.linux.dev>; Wed, 12 Oct 2022 19:06:11 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CIQHox031657;
	Wed, 12 Oct 2022 19:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=Xjb0G2JhrMERchBG1tBZacJIG7CFGc18+TG3PwPJE6g=;
 b=r4pqiydsgTz99rLoj9d71vWyWoX0u8kW1CbVABtBQg3llwhG2wmKlxkzGYbnsbA9e4DD
 QFcL6x5izQZyg9rcoq7uRucaqj/fshAVGmlWLMAVQhB8qvyUF7TF+dH9cngeMANFK+I3
 7ej7rVlFTaoQr7aKwFKpXEghuRImZVE4WYgf79Mt29KAzV6NP0PTQ06pIqr4REeITtDa
 zXB77IIFJp7+8TBE9Jhb+TwPSbg//7qPgpyKUHWxsce6GEzmOCa7pmbMGnLJgRGp7aME
 tYXF5FXpbQc2lQk6BETS1ucnrv2ck7R5O1sdN3LX90GgDI+uzcCWuBi6WuOJVSP71B+x gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k62v1gyjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 19:06:03 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CIwlVa009706;
	Wed, 12 Oct 2022 19:06:03 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k62v1gyj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 19:06:03 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CJ2sFd029553;
	Wed, 12 Oct 2022 19:06:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma01wdc.us.ibm.com with ESMTP id 3k30u9u44a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 19:06:02 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29CJ60Zr28836128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Oct 2022 19:06:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D6AA7805E;
	Wed, 12 Oct 2022 19:40:41 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 808187805C;
	Wed, 12 Oct 2022 19:40:40 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.81.164])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 12 Oct 2022 19:40:40 +0000 (GMT)
Message-ID: <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Tom Lendacky
	 <thomas.lendacky@amd.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>
Date: Wed, 12 Oct 2022 15:05:59 -0400
In-Reply-To: <Y0b6cDIMlKijT95S@work-vm>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
	 <Y0b6cDIMlKijT95S@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wgGp3Ze2qe33pvvDH7prhQ2jXHCDikcX
X-Proofpoint-GUID: dIuv1g3ACuri2Cr76SHZElRToBTw7iCD
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_09,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120123

On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
[...]
> > For the TPM, is it enough to emulate the TPM device register space?
> > Rather than using a PCI BAR or an ACPI memory resource address,
> > could the vTPM driver replicate the TPM register space in ordinary
> > memory for the SVSM to process? Should this memory come from the
> > SVSM or from the guest?

To emulate an existing TPM device, you'd also have to emulate its
discovery mechanism (traditionally ACPI for the CRB TPM).  If you don't
do that you might as well invent a completely new mechanism that suits
the SVSM but requires a new driver.

> > Or is there a better, more efficient method that can be used to
> > perform TPM operations? What would that look like?
> 
> Can we make this look as close to the TPM CRB as possible; from
> discussions with others it looks clear something extra is needed; but
> I don't see the reason to be too inventive.

It is theoretically possible to emulate a CRB TPM with just a single
communication page and an ACPI entry (the Linux CRB driver is ACPI only
at this time and responds to the "MSFT0101" ACPI entry).

The CRB device responds to a very compact MMIO region (0x30 bytes long)
described in the CRB spec:

https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/

In theory we could use a page that keeps trapping to the SVSM for this,
but the problem is that the CRB driver polls a register in the MMIO
region to check command completion, so even a single TPM command is
going to generate a huge number of such traps.  So while it's
theoretically possible to generate a SVSM emulation of the CRB device,
it would likely be too expensive in terms of traps, particularly if
we're using the SVSM vTPM for runtime measurements like IMA.

If we're going to do a new driver, I think basing it off the CRB spec
would be fine (the spec envisages command request/response being via
areas outside the MMIO region) and we could simply do a new driver that
plumbs directly into the nine operations in the tpm_class_ops structure

James


