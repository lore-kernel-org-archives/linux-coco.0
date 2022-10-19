Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5507E
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 15:20:28 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JFIr83021766;
	Wed, 19 Oct 2022 15:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=kGrdJg3HMQD9/4JyM2hDQPHIr0AtiPOe8VkO62ctxAM=;
 b=Yfd0aDpjKsDu+jO99I+a3NHM6ehKhPztUti0o9SUFsyCoVxhW71/I18ni/4lZHSPQOCe
 4R1L/YVFpvj6L01RYaNJ5S+fq9RT0QI177FVdrSRHhpdIj4gVcw5ixZIAHi/12c8ATJE
 8Ka2Kj4xmuB2kq+W1NQ+mg7e2tz+HyHLpj+KDNO0UAF5WjV/xK4j8fvJTvydyiQtls9N
 Hmt71cpvyXLvEFaUSf6s4EGpHeWCg90CyG8fD9Vf9qVpNX1xh8yP298tF7h14jSqc+y2
 Uli+YB+K2FIcHHsNwgygpGnPssD86eom4SZ+IAQEkQgnULe0Y9lWeuUqMxRJ7M6QAjPT zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kaks3r19h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:20:25 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JFKPlX029137;
	Wed, 19 Oct 2022 15:20:25 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kaks3r18k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:20:25 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JF95bA005205;
	Wed, 19 Oct 2022 15:20:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma01dal.us.ibm.com with ESMTP id 3k7mg9bdhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:20:24 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JFKKZm40829608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 15:20:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7F2D7805E;
	Wed, 19 Oct 2022 15:59:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 826FC7805C;
	Wed, 19 Oct 2022 15:59:45 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 15:59:45 +0000 (GMT)
Message-ID: <b488a79617beed8913df61186e8e263c40f2330b.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Tom Lendacky <thomas.lendacky@amd.com>,
        "Daniel P."
	=?ISO-8859-1?Q?Berrang=E9?=
	 <berrange@redhat.com>
Cc: Christophe de Dinechin <cdupontd@redhat.com>,
        Dov Murik
	 <dovmurik@linux.ibm.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>
Date: Wed, 19 Oct 2022 11:20:20 -0400
In-Reply-To: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
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
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EhDIJwMSwebh4ssHw34eq_lMIsTe-VaD
X-Proofpoint-ORIG-GUID: 02npaK6NXSehEXfV-p_eEpf8zzF_0CV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_09,2022-10-19_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190081

On Wed, 2022-10-19 at 09:43 -0500, Tom Lendacky wrote:
> On 10/19/22 08:05, Daniel P. Berrangé wrote:
> > On Wed, Oct 19, 2022 at 08:38:19AM -0400, James Bottomley wrote:
> > > On Wed, 2022-10-19 at 09:08 +0100, Daniel P. Berrangé wrote:
> > > > I'd be inclined to not rely on guest networking, and probably
> > > > even strictly decouple what the SVSM does to communicate, from
> > > > any specific attestation server connection protocol or details.
> > > 
> > > I think we should be clear: if you need a secret at start of day,
> > > before the guest boots, then you need to retrieve an attestation
> > > from the SVSM and inject a secret.  If you can delay needing the
> > > secret until after boot (say for data volumes) then you can use
> > > the cloud standard methods we have today (which actually do
> > > mostly operate over the guest network path) and a TPM which
> > > manufactures on boot.
> > > 
> > > However, the above mechanism is out of scope for the vTPM
> > > project. This is simply about putting a vTPM into the SVSM which
> > > appears in the guest as a TPM and providing a guest API to
> > > retrieve its attestation. So the scope of the project ends there.
> > > 
> > > If we want a TPM with persistent state, then the state has to be
> > > injected pre-boot but that is the same pre-boot problem as all
> > > secret injection.  I think there should be a separate project
> > > working on this and we'll make sure they interlock correctly.
> > > 
> > > So I think there are three pieces
> > > 
> > >     1. Ephemeral vTPM with attestation retrieved from guest
> > >     2. Attestation and injection API from SVSM to host/guest end
> > > point
> > >     3. SVSM API for saving TPM state
> > > 
> > > We'll work initially on 1. Someone else can work on 2. but we'll
> > > make
> > > sure they fit together.  3. would be required for full TPM
> > > emulation,
> > > but might not be required if all we want is persistence of the
> > > seeds of
> > > the TPM, so this would be evaluated when we have 1+2.
> > 
> > Yes, that all makes sense to me as a division of concepts & work.
> 
> There was some offline talk about possibly putting the attestation
> report in the TPM NV area and allowing it to be pulled via TPM
> commands. However,  if we want to be able to supply a new NONCE each
> time, I think, instead, that calls for it's own function in the SVSM
> vTPM protocol.
> 
> Currently, there are two functions in the vTPM protocol:
> 
>    1. An attestation report function
>       - Input:
>           - NONCE GPA (RCX)
>           - NONCE size (RDX)
>           - Report destination GPA (R8)
>           - Report destination size (R9)
>       - Output:
>           - Result code (RAX)
> 
>       NONCE copied to SNP MSG_REPORT_REQ:REPORT_DATA[511:256].
> 
>       SHA-256 (EK Public Key | SRK Public Key) copied to SNP
>       MSG_REPORT_REQ:REPORT_DATA[255:0].

You still have to define *which* public key here.  Recall the TPM
internally has a seed.  First you have to derive the public key from
that seed.  I'd still favour using the NIST-P256 derivation of the
public key according to the TCG template, because NIST is going to
deprecate RSA-2048 at some point.

> 
>       On success, the report is present at Report Destination GPA.
> 
>       If a new way of creating REPORT_DATA is needed in the future,
> the
>       protocol could be extended with a new attestation report
> function


One thing we have to remember is that if we add any additional
attestation APIs, they can't allow them ever be used to generate a
report that looks like a vTPM attestation.  So if that's likely we'll
need multiple types of data put into the report, should we steal a byte
of the report data to specify what type of report (0 for TPM, 1 for the
next type and so on).

That way a consumer could rely on the fact that if the first byte was 0
this must be a vTPM report and nothing else could fake it.

>    2. A vTPM operation function
>       - Input:
>           - Command GPA (RCX)
>           - Command size (RDX)
>           - Response GPA (R8)
>           - Response size (R9)
>       - Output:
>           - Result code (RAX)
> 
>       On success, the result is present at Response GPA.
> 
>       @James Bottomley, I noticed in an earlier response that you had
> the
>       Response size as a possible output, is that needed? The
> response
>       output (header) contains the actual length of the response.

I think we can get away with just command GPA and size and put the
response back into the command buffer, given that's the way the linux
driver will work.  We will still need to return the response size since
it may be less than the command size.  I think the function definition
will have to specify that at least a page is available for writing at
RCX so we can cope with response size > command size.  The current ms
tpm defines the values MAX_COMMAND_SIZE and MAX_RESPONSE_SIZE and
they're currently hard coded to 4096, so we can rely on this value for
a while.

James


