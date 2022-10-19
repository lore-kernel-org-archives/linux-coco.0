Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859805C87
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 23:39:05 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JNb4jF026885;
	Wed, 19 Oct 2022 23:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=ADXsJ1RlpuAtWIKQGS5oScX9y5J0gfhjj+izkPYxuVs=;
 b=W+uYWGy9+2oSuwhtt4lay1fLn50f34ezbvdEpEMzBDgC0nI04eXWNYbqqmgY2Dil6pCR
 GmZ/hLKnPK7zNFuRjgYi42a5Em2LEF2wgwK/rzB5rN/Ckdmdqkip9exHPbnWXKO0shqt
 lV03aOMmojQKucsekOmqGJ0gMQH+msGH2yHpWr6DEGfEIxO36/wZddeCsxQrheJdaLFP
 EAy6+RgIaCbglqfddC7Bw+N5SxpXjb08ay9kbzlX3bqY1rEPC7NBRJ6AKvejSk8uKEAQ
 8snsOdjlSI3/tSr1cfByvfewxuu/If8fnVKHF/80/bDq6sNtpFmrB3gvP4ZqIJuRHLKX FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kat3r1d9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 23:38:57 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JNcuvb033618;
	Wed, 19 Oct 2022 23:38:57 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kat3r1d9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 23:38:56 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JNanFO004632;
	Wed, 19 Oct 2022 23:38:55 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma01dal.us.ibm.com with ESMTP id 3k7mg9ccu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 23:38:55 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JNcsj758458448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 23:38:54 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBBAE7805E;
	Thu, 20 Oct 2022 00:18:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7337A7805C;
	Thu, 20 Oct 2022 00:18:31 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 00:18:30 +0000 (GMT)
Message-ID: <3a3408a4ede88c324d9b9237e291bc399af46792.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Dionna Amalie Glaze <dionnaglaze@google.com>,
        Tom Lendacky
	 <thomas.lendacky@amd.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>,
        "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        Christophe de Dinechin
 <cdupontd@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Date: Wed, 19 Oct 2022 19:38:51 -0400
In-Reply-To: <CAAH4kHYT3uvqypi8XsrSeLzES8ncO_DRbzSdA1zF=csj3QyB4A@mail.gmail.com>
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
	 <CAAH4kHYT3uvqypi8XsrSeLzES8ncO_DRbzSdA1zF=csj3QyB4A@mail.gmail.com>
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
X-Proofpoint-GUID: fnah4AenUQ7CySO6vZC26mH5tvvNiUwz
X-Proofpoint-ORIG-GUID: 7HZi6bSjJ6GVDWmQM45IPRX6_qWF0gd3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_12,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190131

On Wed, 2022-10-19 at 15:14 -0700, Dionna Amalie Glaze wrote:
> > > Hmm, do we need also something like SNP_GET_EXT_REPORT which also
> > > returns the cert-chain stored in the host kernel? Or modify this
> > > call to also return the certs?
> > 
> > Yes, good catch. I believe we do. Adding two more parameters (maybe
> > change this to a struct now?) for Cert Data GPA and Cert Data size
> > is the way to go. We want the Cert Data that is associated with the
> > attestation report that was generated, in an "atomic" way. Once
> > live migration is available, the VM could theoretically be migrated
> > in between two functions calls and then the VCEK wouldn't match.
> > 
> > Thanks,
> > Tom
> > 
> 
> I thought that TPM2_EC_Emphemeral would get the EC public key and
> Tspi_Key_GetPubKey could be used to get the SRK public key.

I don't think I really follow this at all.  Tspi_ was the old Trousers
(TPM 1.2) TSS API and TPM2_EC_Ephemeral is used to generate a random EC
key for use in the two phase commit protocol for doing ECDH.

>  I might be mistaken, but I believe the TPM has commands for this
> already, so the vTPM protocol doesn't need an extra entrypoint. The
> TPM keys shouldn't change through live migration, so querying
> separately should work.

The keys/certificates being referred to above quote are the PSP chip
signing keys used to sign the attestation report.  They do change if
the VM+SVSM is migrated to a new host.  The vTPM will go with the VM so
its seeds will remain the same, but the attestation report binding the
SVSM to the vTPM will change signing keys.

James


