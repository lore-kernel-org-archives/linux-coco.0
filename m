Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F684416
	for <linux-coco@lists.linux.dev>; Thu, 13 Oct 2022 19:20:49 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DHfKo9028727;
	Thu, 13 Oct 2022 19:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=k2AxUxhE5N3XVEBRFjY3zS4s6dYlQzIhpKHMd0v5qSU=;
 b=Y6Ajfo1BjWQ786FGgYJVYFagCFqE2Lc4rQ3pWps0gKP535AqBN5zKaeEsCOMu/irw2hT
 Pj2A/RCM2xC29KR9Jby+hhPyh2x7DPAuogqugPYPm2Nbwq4iKexdTlSzKs/w5GlGHHz/
 v1EIsOIbU8UtO7Kptlrfy9m8hHMt/2V+C75HTNVSDuykmdS3dATn8MfLKI95Pbig7aCc
 +HIxBBRnNptfYf6uEkqgztqaMZscfPLFuIcdmA9Curz+oW3pz5cxAjbYdIoD7gMIViI0
 S3K17VxHNvlclsC8Rrhpl5XLFotdIGk52BxkQbAo/ibwAHgeYNaP+JxoKjvRRg3Y0Q8D bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6gp906hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 19:20:41 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DHr0DY009041;
	Thu, 13 Oct 2022 19:20:41 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6gp906ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 19:20:41 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DJ50wj020975;
	Thu, 13 Oct 2022 19:20:40 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma01wdc.us.ibm.com with ESMTP id 3k30ua1njq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 19:20:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29DJKfeK42991982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Oct 2022 19:20:41 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 163D27805E;
	Thu, 13 Oct 2022 19:56:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48F467805C;
	Thu, 13 Oct 2022 19:56:00 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.81.164])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 13 Oct 2022 19:55:59 +0000 (GMT)
Message-ID: <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Tom Lendacky <thomas.lendacky@amd.com>,
        "Dr. David Alan Gilbert"
	 <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>
Date: Thu, 13 Oct 2022 15:20:37 -0400
In-Reply-To: <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
	 <Y0b6cDIMlKijT95S@work-vm>
	 <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
	 <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C9q-zlyYA6dTwxEcHAE_SM49_lon8nNl
X-Proofpoint-GUID: F3Cp32BsmbYp9PFEsjZOBoJFe1C935LK
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130108

On Thu, 2022-10-13 at 13:54 -0500, Tom Lendacky wrote:
> On 10/12/22 14:05, James Bottomley wrote:
> > On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
> > > * Tom Lendacky (thomas.lendacky@amd.com) wrote:
> ...
> > It is theoretically possible to emulate a CRB TPM with just a
> > single
> > communication page and an ACPI entry (the Linux CRB driver is ACPI
> > only
> > at this time and responds to the "MSFT0101" ACPI entry).
> > 
> > The CRB device responds to a very compact MMIO region (0x30 bytes
> > long)
> > described in the CRB spec:
> > 
> > https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/
> > 
> > In theory we could use a page that keeps trapping to the SVSM for
> > this,
> > but the problem is that the CRB driver polls a register in the MMIO
> > region to check command completion, so even a single TPM command is
> > going to generate a huge number of such traps.  So while it's
> > theoretically possible to generate a SVSM emulation of the CRB
> > device,
> > it would likely be too expensive in terms of traps, particularly if
> > we're using the SVSM vTPM for runtime measurements like IMA.
> > 
> > If we're going to do a new driver, I think basing it off the CRB
> > spec
> > would be fine (the spec envisages command request/response being
> > via
> > areas outside the MMIO region) and we could simply do a new driver
> > that
> > plumbs directly into the nine operations in the tpm_class_ops
> > structure
> > 
> 
> This sounds good. I think we can model an API call to the SVSM vTPM
> using 
> this. We can provide a struct that looks similar to the CRB Control
> Area 
> and supply the GPA of this struct in RCX to the SVSM for the vTPM to 
> perform the operation:
> 
>      - Command GPA
>      - Command Size
>      - Response GPA
>      - Response Size
>      - Status

Realistically, I think all TPM2 command/response actions can be packed
into

u32 TPM2_action(u64 command_gpa, u32 command_len, u64 response_gpa, u32
*response_len)

Where the u32 return would be the status (although if the SVSM has
trouble with the return status, we could add it as an extra modified
variable).

The way the current TPM driver interface works is shown in the
tpm_class_ops structure:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/tpm.h

we can shim all the non-ignorable calls into the above.  The standard
way of sending a command is tpm_try_transmit in

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/tpm/tpm-interface.c

I think we can emulate an interrupt driven tpm (set TPM_CHIP_FLAG_IRQ
in the driver) and it will simply do a ->send() ->receive() pair, which
works for us since the thread of execution in ->send() will pass into
the SVSM and return with the result which we can then copy over in
->recv

Also note that tpm_try_transmit() uses the same buffer for send and
receive, so it is possible to reduce the number of parameters in
TPM2_action() above if that's the route people want to go.

> Anything else that would go in the struct? Locality?

Well, this is a question.  CRB devices are actually allowed not to have
a locality at all, so ignoring it is perfectly legal.  On the other
hand, locality is used to allow or deny certain accesses. 
Traditionally you allow firmware access at locality 4 as the trusted
hardware component.  However, the problem with implementing localities
is how does the SVSM know where we're calling from?  If it's unable to
bar access at certain localities, there's not much point implementing
them.  For reference the TIS TPM implements separate memory maps of its
registers, one for each locality and firmware bars access to the OS by
unmapping a range and refusing to allow the OS to map it back.

I suspect we'd get on faster by being pejorative and saying we won't
implement locality since we can't police it.

James
 

