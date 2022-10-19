Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0ED28E8
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 11:45:24 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JBgGRD030293;
	Wed, 19 Oct 2022 11:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=6J2PBLpKQJR7WifJWR9rbqTu1DRlYwlTpAqx44KZF+A=;
 b=Fo8fMNNOZY+ckjyH6fuD7C/rYYcLUVrwxxafUZ9lS01KKBsyRYfSAnyaa+wA+k9PN/wL
 ektz+mx721uqQ1MDOdivesF0v122qxOoRJXG+BAaA7gs2HHhpYdIM+umMlAN2OFK2nr5
 iWb1uEBege5kKIq6nKjFYPSKHltgfP2IlBtdDRGGqkNu3EO7uJGz5svUegCfVtQ6KttV
 s0vn0nva/vIFVTVbrlHKGrSWo4HMVP79KhyR6e7aFYEQZAwZmqUK4/GNPhJ3yaxi05K8
 2uTH67sC3toxnIgxIMzlxEwejN+OKg+tGhRaVetbFIo+a0FoSlEbhwFV9tgqQ7OhoBsr 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kagkbr2w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 11:45:20 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JBhC12000898;
	Wed, 19 Oct 2022 11:45:20 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kagkbr2vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 11:45:20 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JBaOCQ010117;
	Wed, 19 Oct 2022 11:45:19 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma03dal.us.ibm.com with ESMTP id 3k7mga22at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 11:45:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JBjHn111010648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 11:45:17 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE0C57805E;
	Wed, 19 Oct 2022 12:24:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD6BE7805C;
	Wed, 19 Oct 2022 12:24:34 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 12:24:34 +0000 (GMT)
Message-ID: <4d383fa713f3d976c495804540dd910d79964c82.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Christophe de Dinechin
	 <cdupontd@redhat.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>,
        Tom Lendacky
 <thomas.lendacky@amd.com>,
        "amd-sev-snp@lists.suse.com"
 <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>
Date: Wed, 19 Oct 2022 07:45:15 -0400
In-Reply-To: <Y0/dzjGHnLUFgDQP@work-vm>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
	 <Y0b6cDIMlKijT95S@work-vm>
	 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
	 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
	 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
	 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
	 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
	 <Y0/dzjGHnLUFgDQP@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8inlcqV5KB0snPI1yYBlFLJGDysPtYIS
X-Proofpoint-ORIG-GUID: ne8horzjvdi9vkH3QpoOCvoMq_9ug3az
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_06,2022-10-19_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190064

On Wed, 2022-10-19 at 12:21 +0100, Dr. David Alan Gilbert wrote:
> * Christophe de Dinechin (cdupontd@redhat.com) wrote:
> > > On 18 Oct 2022, at 22:22, Dov Murik <dovmurik@linux.ibm.com>
> > > wrote:
> > > On 13/10/2022 18:30, James Bottomley wrote:
> > > > On Thu, 2022-10-13 at 10:14 -0500, Tom Lendacky wrote:
> > > > > On 10/12/22 13:44, James Bottomley wrote:
> > > > > > On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert
> > > > > > wrote:
> > > > > > > * Tom Lendacky (thomas.lendacky@amd.com) wrote:
> > > > > > [...]
> > > > > > > I think one of the vTPMs keys should be in the SNP
> > > > > > > attestation report (the EK???) - I think that would allow
> > > > > > > you to attest that the vTPM you're talking to is a vTPM
> > > > > > > running in an SNP protected firmware.
> > > > > > 
> > > > > > Traditionally the TPM identity is the public EK, so that
> > > > > > should definitely be in the report.  Ideally, I think the
> > > > > > public storage root key (key derived from the owner seed)
> > > > > > should be in there two because it makes it easy to create
> > > > > > keys that can only be read by the TPM (keys should be in
> > > > > > the owner hierarchy which means they have to be encrypted
> > > > > > to the storage seed, so we need to know what a public key
> > > > > > corresponding to it is).
> > > > > > 
> > > > > > One wrinkle of the above is that, when provisioned, the TPM
> > > > > > will only have the seeds, not the keys (the keys are
> > > > > > derived from the seeds via a TPM2_CreatePrimary
> > > > > > command).  The current TPM provisioning guidance:
> > > > > > 
> > > > > > https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/
> > > > > > 
> > > > > > Says that the EK should be at permanent handle
> > > > > > 
> > > > > > 81010001
> > > > > > 
> > > > > > And there's an update saying that should be the RSA-2048
> > > > > > key and there should be an EC (NIST-P256) one at
> > > > > > 81010002.  The corresponding storage keys should be at
> > > > > > 81000001 and 81000002 respectively.  I think when the SVSM
> > > > > > provisions the TPM, it should run TPM2_CreatePrimary for
> > > > > > those four keys and put them into the persistent indexes,
> > > > > > then insert the EC keys only for EK and SRK into the
> > > > > > attestation report.
> > > > > 
> > > > > We only have 512 bits to work with for the SVSM-provided
> > > > > data, so would hashes of the keys be ok?
> > > > 
> > > > Well, if you put the hashes in, the consuming entity would then
> > > > have to find out via an additional channel what the actual keys
> > > > were because you can't reverse the hash (it's possible, just
> > > > more effort).  If you use point compression, an EC key (for the
> > > > NIST p-256 curve) is only 32 bytes anyway, so it's the same
> > > > size as a sha256 hash, so I'd say place the actual public keys
> > > > into the report to give complete and usable information
> > > > 
> > > 
> > > Do we need to leave room for a Guest-Owner-provided nonce?  Guest
> > > owner will provide it to the guest OS which will provide it to
> > > the SVSM to be included in REPORT_DATA of the VMPL0 attestation
> > > report.
> > > 
> > I think it’s a good idea, but I’m not clear on which component in
> > the guest would be responsible for that exchange.
> 
> Hang on; we're mixing a few levels here.
> 
> To go back to Dov's question; the only reason to worry about 'leaving
> room' for a nonce is James's idea of including actual keys and taking
> all the space up.

Actually I didn't say I'd take up all the space.  I said including an
EC EK would take up half the space.  I asked AMD the question of where
the nonce goes separately and it does seem it has to go in here as
well, so that would rule out including the EC SRK.  That being the case
I'm fairly ambivalent whether the keys are hashed or not because you'll
need to know the SRK to wrap a key to the TPM, so you'd have to ask the
TPM to certify the SRK with the EK before you wrap.  I was interested
in providing full information in the report so you could wrap simply by
seeing it without asking for additional values, but it looks like that
isn't possible.

If the ECEK and the nonce are in the report, the sequence is

request report from SVSM and return it

verify report

TPM2_Certify(ECSRK with ECPRIMARY)

return certification data which guest owner verifies
Wrap key to ECSRK and send to guest

If the nonce and a sha256(ECPRIMARY|ECSRK) are in the report, the
sequence is

request report from SVSM
TPM2_ReadPublic(81010002)
TPM2_ReadPublic(81000002)
return both keys and report

recreate hash and verify report
Wrap key to ECSRK and send to guest

I don't think there's much in it.

>   IMHO that sounds delicate, and dependent on the key type etc -
> where as if you include a hash, then you can mix a nonce in as well.

Half nonce half information (32 bytes each) sounds about right.  I have
a slight preference for including a nonce directly rather than hashed
because for durable attestation you can prove independent nonces simply
from the report.  If you hash the nonce you need both it and the report
in the durable attestation.

James



