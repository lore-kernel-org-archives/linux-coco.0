Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020A28E7
	for <linux-coco@lists.linux.dev>; Wed, 12 Oct 2022 18:45:08 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CILwTH026586;
	Wed, 12 Oct 2022 18:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=okCB1wCKWeFNmwM9RCzHQl+bQHoaSk4/uYfa8FIsv3g=;
 b=QB12t4Y3RSNA4A1W45H5uLpDuX9u/kFX+ZwMq5iKLNl+bKGxDKcdG3NpVVFLAVhbs0NW
 yp3TifnBDLCnGCSlw00E3I/ZTcpQjM9U3x+i6gQARCXIWsRdTQilv6uWTVMBct+0ed4W
 py1JTEB+TAeHBEInomNVwwH8/PewuyxV1a0aYRTM1bUfUexnrqU76vU17IxIomsiO3z/
 dmacVug+5hWFqSIv4xXNKdZ6IgNxOfsUY3U/UIOCwKd79Ms9ZTa/v5krv9a1TXzJIShG
 RU4F1zzgHwarzreyEmLeRC7OGNstRU7vnEsFEjZkdbxCZkeoQuK1vyedArQqRy8HsgAd tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k62t08esm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 18:45:00 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CIb9pK018304;
	Wed, 12 Oct 2022 18:44:59 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k62t08es2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 18:44:59 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CIa9QC001996;
	Wed, 12 Oct 2022 18:44:58 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma03dal.us.ibm.com with ESMTP id 3k30ub1pmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 18:44:58 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29CIivOj18416298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Oct 2022 18:44:57 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5827E7805E;
	Wed, 12 Oct 2022 19:19:36 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BB157805C;
	Wed, 12 Oct 2022 19:19:35 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.81.164])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 12 Oct 2022 19:19:35 +0000 (GMT)
Message-ID: <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Tom Lendacky
	 <thomas.lendacky@amd.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>
Date: Wed, 12 Oct 2022 14:44:55 -0400
In-Reply-To: <Y0b6cDIMlKijT95S@work-vm>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
	 <Y0b6cDIMlKijT95S@work-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y-8sWOzVwNG1e0cavdwFOp2nxi-rdj8L
X-Proofpoint-GUID: 3AVthIFzlmuXKTOCh2sVwJUpXejZxxKf
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1011 phishscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120119

On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
[...]
> > What would an enlightened guest need from the SVSM for attestation
> > of the SVSM/vTPM? What would a vTPM driver need to supply to an
> > SVSM for TPM operations?
> > 
> > For attestation, the SVSM could provide a VMPCK0 attestation
> > report. What, if any, data should the guest supply to the SVSM to
> > be part of the SNP attestation report data? Should this attestation
> > request be part of the SVSM base protocol?
> 
> I'm not quite sure what a 'VMPCK0 attestation report' is?
> It's important that the VMPL level in the attestation report reflects
> the side asking for the attestation; in particular one TPM story goes
> that the firmware (in VMPL0) would ask for an attestation and the
> attestor would return the vTPM stored state.  It's important that the
> state could only be returned to the vTPM not the guest, so the
> attestor would check that the VMPL level in the attestation was 0;
> any guest attestation would have a VMPL>0 and so the attestor
> wouldn't hand it the vTPM state.
> Hmm or are you saying such a report would be triggered by the guest
> rather than the firmware, but it would be protected by VMPCK0 so the
> guest wouldn't be able to read it?
> 
> I think one of the vTPMs keys should be in the SNP attestation report
> (the EK???) - I think that would allow you to attest that the vTPM
> you're talking to is a vTPM running in an SNP protected firmware.

Traditionally the TPM identity is the public EK, so that should
definitely be in the report.  Ideally, I think the public storage root
key (key derived from the owner seed) should be in there two because it
makes it easy to create keys that can only be read by the TPM (keys
should be in the owner hierarchy which means they have to be encrypted
to the storage seed, so we need to know what a public key corresponding
to it is).

One wrinkle of the above is that, when provisioned, the TPM will only
have the seeds, not the keys (the keys are derived from the seeds via a
TPM2_CreatePrimary command).  The current TPM provisioning guidance:

https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/

Says that the EK should be at permanent handle

81010001

And there's an update saying that should be the RSA-2048 key and there
should be an EC (NIST-P256) one at 81010002.  The corresponding storage
keys should be at 81000001 and 81000002 respectively.  I think when the
SVSM provisions the TPM, it should run TPM2_CreatePrimary for those
four keys and put them into the persistent indexes, then insert the EC
keys only for EK and SRK into the attestation report.

James


