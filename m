Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7E23D6
	for <linux-coco@lists.linux.dev>; Sat, 29 Oct 2022 13:27:21 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29TCKFPY008868;
	Sat, 29 Oct 2022 13:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=BMXRiV5g6a9b9eG8P+NznTGsXGuxvn1/XMRQEfzVbVM=;
 b=Jt86PZy2QTB5wg7I4syCr5RTJBTN9BxFr4Mk0olY2FD/4vcsJmodrLjp1YirVZHuVMW+
 3lIxQH4INjEstZ0mOJEOcXWU25JTcNw9t1D6iagiqKENCyZcJTYltpimw7q1W7uTxLPz
 2b4eYNguXWR0LiTUzcZfc2jt/+jYA9stlWtWjBPEVi1boEhnGQtaN4Z/cYsk5wCitIpR
 qoIehsK3uhWKxbfWHBuKRmNqiGJSOR/fHz1ktsdoEAjTtWwlHvZJmOqYTMIVYJyhMjid
 9GyNLbieiuglqMX4dbuNc1gYZ5V7fLJADqqlcQBU7KJ7sstnm/I5kRQ8emrT48wLJAPx Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgw6k0k2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Oct 2022 13:27:20 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29TDRKAM020588;
	Sat, 29 Oct 2022 13:27:20 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgw6k0k26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Oct 2022 13:27:20 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29TD6COr022051;
	Sat, 29 Oct 2022 13:27:18 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma01wdc.us.ibm.com with ESMTP id 3kgut92dh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Oct 2022 13:27:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29TDRJ1m14156336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Oct 2022 13:27:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71C7E7805E;
	Sat, 29 Oct 2022 14:13:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C36D7805C;
	Sat, 29 Oct 2022 14:13:33 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.163.14.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Sat, 29 Oct 2022 14:13:32 +0000 (GMT)
Message-ID: <86a90a4530af01f94ba58c73d5c1750cea682476.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Steve Rutherford <srutherford@google.com>
Cc: Christophe de Dinechin <cdupontd@redhat.com>,
        Dov Murik
	 <dovmurik@linux.ibm.com>,
        "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
	 <berrange@redhat.com>,
        David Altobelli <David.Altobelli@microsoft.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Sat, 29 Oct 2022 09:27:15 -0400
In-Reply-To: <CABayD+e5LYgNvuu1-Pd9LmKHiWZr5HcfTX9ueG8ibvq8zmAPhQ@mail.gmail.com>
References: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
	 <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
	 <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
	 <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
	 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
	 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
	 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
	 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
	 <7e67f33577aaebe09205c9a93597de9f742fd08f.camel@linux.ibm.com>
	 <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
	 <Y1ZwJvNvky6Wst7k@work-vm>
	 <d8b21444-7829-5f5c-41dd-b103ae3a52fa@linux.ibm.com>
	 <682a4227-aa79-298c-2ced-5f401c9d4339@amd.com>
	 <e4a13b17-7317-dd49-d203-cf149e2d5eb4@linux.ibm.com>
	 <m2bkq0i67q.fsf@redhat.com>
	 <461f5c5e76dc5280f25f4a8627188cb16b2c2f72.camel@linux.ibm.com>
	 <CABayD+e5LYgNvuu1-Pd9LmKHiWZr5HcfTX9ueG8ibvq8zmAPhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mOZsr0HBMV4OmXcaJvVpIHU3NPM3iLtS
X-Proofpoint-ORIG-GUID: NhXpqZUwqjuwBHWgzSo1Sc_YnkQ_R2na
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
 definitions=2022-10-29_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210290092

On Fri, 2022-10-28 at 17:25 -0700, Steve Rutherford wrote:
> Seems like this thread has petered out a bit, but without all the
> concrete details. A few remaining questions I have:
> 
> 1) Is JSON good enough? or should the report use CBOR? (Both seem
> fine. CBOR seems popular for similar situations).

Well, neither I would think.  If everyone's determined to use a key
value representation, the utility of which I still question since we
have no current need for it, then we'd should at least use one that has
a natural representation for binary data (the only thing the vTPM wants
to return), which neither JSON nor CBOR have.

> 2) Do the contents of the vtpm sub-section need to be pre-specified
> (i.e. standardized)? Or are they going to be completely customizable?
> (For example, there are many standard EKs, though the ECC one
> (template L-2) is probably the one most people will want.

The TCG is having a bit of rapid evolution on this:

https://trustedcomputinggroup.org/resource/tcg-ek-credential-profile-for-tpm-family-2-0/

However, all their previous specs only had L-1 for RSA and L-2 for EC, 
and manufacturers have so far only produced physical TPMs based on
that, so I think we would too.  I think L-2 is best because EC keys are
small and have the NIST preferred 128 bits of security.

>  I've discussed the idea of an ephemeral "null hierarchy only" TPM
> with some coworkers, but that would complicate standardization of any
> EK in these reports. I'd also like to bolt on an AK (i.e. a default
> EK-like signing key in the endorsement hierarchy) to some reports we
> end up providing, but I don't see a need for that to be guaranteed in
> every report. It just needs to be c ompatible with whatever we choose
> here. Google provides a trusted AK for existing vTPMs.)

I've got to ask why?  The reason for using an AK is because the TPM
protocol tries to anonymize quotes, so the EK proves the AK to a
privacy CA and the privacy CA vouches for the AK to the relying party
but the relying party can't use the quote or the AK to track the TPM. 
If you don't need the privacy property (which you lose if you provide
the AK) you just make the EK able to sign as well as encyrpt, so the EK
can also be the trusted AK.  There's no need to add additional
complexity.  I suggested a while back we might want a signing EK for
this reason, since the guest owner both verifies the vTPM and consumes
the quotes there's no need for privacy.

> 3) If reports are customizable, how do we avoid collisions that could
> lead to misinterpretations across vendors? Do reports need a
> vendor-specific key carved out for individual vendors to scribble in?

There's a nonce to prevent reply and provide a challenge/response
security check.  I would also think that if a key value representation
is chosen, the values would be standardized for each key and all the
vendor could do is choose keys.  This is why I think we're over
designing.  As long as the report can be extended, we can leave arguing
over the future extensions when they come along.  Right at the moment
we're wasting an enormous amount of time arguing over potential future
extensions, while not addressing the current problem of what
information does the current vTPM report need to provide?  Just p256 EC
or p256 EK+SRK or something else?

> 4) Are there going to be any custom inputs that get passed through
> from the guest to the report other than a nonce? (I think the answer
> is no, but want to make sure I'm not missing something here)

I think only nonce.

> 5) How will all of this interact with persistent storage of the
> seeds/NVDATA? (My current thought is that the report should summarize
> how the SVSM stored its NVDATA and who/what it trusted. So long as
> it's possible to add those details to the report, I'm not sure we
> need to align on the precise details of NVDATA-persistence
> attestation right now.)

We already discussed that upthread. the conclusion was:

https://lore.kernel.org/all/Y0%2F2D93P%2Fxgp1sU9@redhat.com/

The persistent data has to be injected into the SVSM via secret
injection so you trust it a priori.

James


