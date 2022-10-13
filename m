Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A64429
	for <linux-coco@lists.linux.dev>; Thu, 13 Oct 2022 21:42:00 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DK75SG031896;
	Thu, 13 Oct 2022 21:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=ZF1h2wcnXACUVgJGKWxsOr9ZzyIft5MAg/8ii/TU2ZQ=;
 b=GaSxc+9Kuue/DtCmAtdwuohPJt5TLoVVmT0H4oMeFD1VEJ1TknB+PUnFC3e9yjREfdWB
 lrnkhbAvNPDkhIfma0WC56FPK5FwK5rT96QhIqnsVGANMhHZOOqmtZ9C9cMWFW9u/P/k
 x6fY5mSqesMPyvscqkqzqUsXxsNP8SvYn3ahXdl4t5EaOFajKP0cCLRT8NGGkMSaFpLS
 7pkiuS6xzYiWabKMefLq07x3/1JI22tyGQV8cXQYuWU95HK5NMPXujnbAXIKtdrlbQdq
 QyvI1LN1CYbS9xit9A7WgAl86JaBq/m3JZrB+VpgkZtp9fees8zxASNnl9HM00mP5BBr /g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6g0bw2bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 21:41:53 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DLUhbw009428;
	Thu, 13 Oct 2022 21:41:53 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6g0bw2b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 21:41:53 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DLZtjB017910;
	Thu, 13 Oct 2022 21:41:51 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma05wdc.us.ibm.com with ESMTP id 3k30ub29qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 21:41:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29DLfp8j59900340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Oct 2022 21:41:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81A497805E;
	Thu, 13 Oct 2022 22:17:16 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D7787805C;
	Thu, 13 Oct 2022 22:17:15 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.81.164])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 13 Oct 2022 22:17:14 +0000 (GMT)
Message-ID: <ce89a3298963f4fa234e46ae9fe00da66e2ff819.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        Tom Lendacky
	 <thomas.lendacky@amd.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>,
        Stuart Yoder <stuart.yoder@arm.com>,
        Andrew
	Cooper <andrew.cooper3@citrix.com>
Date: Thu, 13 Oct 2022 17:41:48 -0400
In-Reply-To: <b51ea7a5-256e-5138-d956-ddacd4148f9c@apertussolutions.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
	 <Y0b6cDIMlKijT95S@work-vm>
	 <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
	 <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
	 <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
	 <3474b28c-2de2-db95-9ecf-6b7c1a59d860@apertussolutions.com>
	 <a77148556d530d6b6983d8fb1c6d8bdaf81cb695.camel@linux.ibm.com>
	 <b51ea7a5-256e-5138-d956-ddacd4148f9c@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iKrZB_WVjeAhNjzXu3oicrQRpZkErwE9
X-Proofpoint-ORIG-GUID: 3-fPhCESh4CA3D1r1IfKBLb30xdQ3oAy
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
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130120

On Thu, 2022-10-13 at 17:14 -0400, Daniel P. Smith wrote:
> On 10/13/22 17:06, James Bottomley wrote:
> > On Thu, 2022-10-13 at 16:54 -0400, Daniel P. Smith wrote:
> > > Pardon the interjection.
> > > 
> > > On 10/13/22 15:20, James Bottomley wrote:
> > > > On Thu, 2022-10-13 at 13:54 -0500, Tom Lendacky wrote:
> > > > > On 10/12/22 14:05, James Bottomley wrote:
> > > > > > On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert
> > > > > > wrote:
> > > > > > > * Tom Lendacky (thomas.lendacky@amd.com) wrote:
> > > > > ...
> > > > > > It is theoretically possible to emulate a CRB TPM with just
> > > > > > a
> > > > > > single
> > > > > > communication page and an ACPI entry (the Linux CRB driver
> > > > > > is
> > > > > > ACPI
> > > > > > only
> > > > > > at this time and responds to the "MSFT0101" ACPI entry).
> > > > > > 
> > > > > > The CRB device responds to a very compact MMIO region (0x30
> > > > > > bytes
> > > > > > long)
> > > > > > described in the CRB spec:
> > > > > > 
> > > > > > https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/
> > > 
> > > IMHO I would not use the mobile CRB, which was designed as a
> > > doorbell solution for ARM where trapping a page was not possible.
> > > Since it is possible to trap on page access, this makes it
> > > possible
> > > to implement the PC Client MMIO interface and enables
> > > implementations
> > > to provide the complete set of TPM capabilities, e.g. localities.
> > 
> > You mean the TIS interface:
> > 
> > https://trustedcomputinggroup.org/resource/pc-client-work-group-pc-client-specific-tpm-interface-specification-tis/
> > 
> > We discussed this at length with AMD ... which I think isn't
> > captured in the email archives, unfortunately.  However, the bottom
> > line is that TIS uses a FIFO approach to sending data through the
> > MMIO page.  That's simply unscalable for pure emulation because it
> > will result in 10-100x the number of write traps in the MMIO page
> > as the CRB driver which uses a MMIO mailbox to trigger actions but
> > passes the data via physical page addresses not FIFOs.
> 
> Yes I am referring to the TIS interface but FIFO is only one of the 
> software interface defined in the spec. There is also the TIS CRB 
> interface which I should enable a similar experience as the mobile
> CRB.

Well, not in the above spec there isn't, it's a pure FIFO.  I think you
might be thinking of the PTP spec:

https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/

which defined locality mapping for the CRB interface (among other
things).  But regardless of the TCG maze of slightly overlapping specs,
I think you now agree we can't use the FIFO interface because of the
high access trap overhead.  The outstanding question is over
localities, but simply implementing the PTP multiple pages won't give
us that.  It works for physical hardware because there's an motherboard
implementation specific way of shutting off access to MMIO registers at
a given locality.  We'd have to define such a thing for the SVSM ...
but, as of today, it's not really properly defined for OVMF, indicating
no-one's really using it as a security property for virtual
environments.

James




