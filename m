Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A633C5
	for <linux-coco@lists.linux.dev>; Thu, 13 Oct 2022 15:30:24 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DEGAVY023097;
	Thu, 13 Oct 2022 15:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=MXtxUyUVhbkqluzsklft5PDdAie5a/n0LC/rv+Jc1Fo=;
 b=WC7lgHFX/jMf8tK68wihI9A/57ljFkD+z/OrqPmUS98c+9RYmkR4lzllvzdtjBtWDK8q
 FLLetXwOi00rytHLidI8vpXFiz/VvYjmduaNJf+Q1QRx4SHO1Kv9tNbKftVDAeDBk89O
 Flm866c1zehcE662ux8WD1Jxo02k2QcURhyPBO4NvF395Q08zCkbcrIN7mmhNfdt1YJ4
 W3hRc6kI0oOkAXpNROsgof8cDhsuyRUazo9ljOzBpAlNGsKu3EmsB3MXCOwrUkt1tsKN
 +kWi1Sf4v02cDjfoo5XfDLQto4SUvt4nJKrWs+fC57PrGqbxB1g97hproLvMpjJ83xW8 Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6gp8sqc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 15:30:18 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DFBWro014122;
	Thu, 13 Oct 2022 15:30:17 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6gp8sqbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 15:30:17 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29DFKCi4016791;
	Thu, 13 Oct 2022 15:30:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma03dal.us.ibm.com with ESMTP id 3k30ub8mnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 15:30:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29DFUIgF12649186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Oct 2022 15:30:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E9857805C;
	Thu, 13 Oct 2022 16:05:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 497C27805E;
	Thu, 13 Oct 2022 16:05:29 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.81.164])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 13 Oct 2022 16:05:28 +0000 (GMT)
Message-ID: <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Tom Lendacky <thomas.lendacky@amd.com>,
        "Dr. David Alan Gilbert"
	 <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>
Date: Thu, 13 Oct 2022 11:30:13 -0400
In-Reply-To: <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
	 <Y0b6cDIMlKijT95S@work-vm>
	 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
	 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Aqp1_-3yOJS2dbgjKG_YtqTFZt5QbhRe
X-Proofpoint-GUID: 4cNhQ-FJBRAfTYd3peZEy9EqXrOkER4a
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
 engine=8.12.0-2209130000 definitions=main-2210130088

On Thu, 2022-10-13 at 10:14 -0500, Tom Lendacky wrote:
> On 10/12/22 13:44, James Bottomley wrote:
> > On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
> > > * Tom Lendacky (thomas.lendacky@amd.com) wrote:
> > [...]
> > > It's important that the VMPL level in the attestation report
> > > reflects the side asking for the attestation; in particular one
> > > TPM story goes that the firmware (in VMPL0) would ask for an
> > > attestation and the attestor would return the vTPM stored
> > > state.  It's important that the state could only be returned to
> > > the vTPM not the guest, so the attestor would check that the VMPL
> > > level in the attestation was 0; any guest attestation would have
> > > a VMPL>0 and so the attestor wouldn't hand it the vTPM state.
> > > Hmm or are you saying such a report would be triggered by the
> > > guest rather than the firmware, but it would be protected by
> > > VMPCK0 so the guest wouldn't be able to read it?
> 
> No, the VMPCK0 key is just used for communication with the PSP.
> 
> While the SVSM would request the attestation report from the PSP,
> the guest would need to request it from the SVSM.

I think this is fine.  The SVSM would do the attestation as it starts
the TPM but the guest would be able to retrieve it at any time. 
Essentially, if you use something like keylime, the agent would request
it on start up to prove it should trust the vTPM, but that could occur
way after VM boot.

> 
> > > I think one of the vTPMs keys should be in the SNP attestation
> > > report (the EK???) - I think that would allow you to attest that
> > > the vTPM you're talking to is a vTPM running in an SNP protected
> > > firmware.
> > 
> > Traditionally the TPM identity is the public EK, so that should
> > definitely be in the report.  Ideally, I think the public storage
> > root key (key derived from the owner seed) should be in there two
> > because it makes it easy to create keys that can only be read by
> > the TPM (keys should be in the owner hierarchy which means they
> > have to be encrypted to the storage seed, so we need to know what a
> > public key corresponding to it is).
> > 
> > One wrinkle of the above is that, when provisioned, the TPM will
> > only have the seeds, not the keys (the keys are derived from the
> > seeds via a TPM2_CreatePrimary command).  The current TPM
> > provisioning guidance:
> > 
> > https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/
> > 
> > Says that the EK should be at permanent handle
> > 
> > 81010001
> > 
> > And there's an update saying that should be the RSA-2048 key and
> > there should be an EC (NIST-P256) one at 81010002.  The
> > corresponding storage keys should be at 81000001 and 81000002
> > respectively.  I think when the SVSM provisions the TPM, it should
> > run TPM2_CreatePrimary for those four keys and put them into the
> > persistent indexes, then insert the EC keys only for EK and SRK
> > into the attestation report.
> 
> We only have 512 bits to work with for the SVSM-provided data, so
> would hashes of the keys be ok?

Well, if you put the hashes in, the consuming entity would then have to
find out via an additional channel what the actual keys were because
you can't reverse the hash (it's possible, just more effort).  If you
use point compression, an EC key (for the NIST p-256 curve) is only 32
bytes anyway, so it's the same size as a sha256 hash, so I'd say place
the actual public keys into the report to give complete and usable
information

James


