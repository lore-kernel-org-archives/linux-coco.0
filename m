Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4828D29CA
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 12:38:27 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JCKi4H021663;
	Wed, 19 Oct 2022 12:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=ldJJLVZ144cUkVX/42W3chhX/XnLGGnCyob/eClwSus=;
 b=WupLfNzJ8jouShqNwDrJJXDVuNlOFr+oaVYjzR8mU/g+oFtxAL4CkTk73Df/1Z926dib
 78c4M6Q/l0a1x4T7jfuWZ2bYVwHFh6/x0FAa5gD+WAp3RjuIwlwgsVV81CpMBhKXqrUF
 PhhNpBeAjNN9g23p68ccJ5E8ze6lFEd8dRTOC7gcDD1K2Qphg6VqZiHHPQAv3f8MpZLN
 zqopQC6ZRUH5Dvp2ZBijZlzq9ntp/iLX06fZeYMYSqEHMiVgobeRGjqFBXV8RJJcbGF7
 jsDKd766LrIY7UK3wQMJIRi4g48ZwQ1WbVbG0QY4leR4qblOKPc8Ol7hrxbD7rvEu7H0 QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kah5drhm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 12:38:24 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JCKiQN021656;
	Wed, 19 Oct 2022 12:38:24 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kah5drhk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 12:38:24 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JCbr7E016244;
	Wed, 19 Oct 2022 12:38:22 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma02wdc.us.ibm.com with ESMTP id 3k7mga5s09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 12:38:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JCcLIj27198170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 12:38:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 564697805E;
	Wed, 19 Oct 2022 13:17:41 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 240047805C;
	Wed, 19 Oct 2022 13:17:39 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 13:17:39 +0000 (GMT)
Message-ID: <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        Christophe de Dinechin
	 <cdupontd@redhat.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>,
        Tom Lendacky
 <thomas.lendacky@amd.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Date: Wed, 19 Oct 2022 08:38:19 -0400
In-Reply-To: <Y0+wcWgcRFTiDTNk@redhat.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
	 <Y0b6cDIMlKijT95S@work-vm>
	 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
	 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
	 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
	 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
	 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
	 <Y0+wcWgcRFTiDTNk@redhat.com>
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
X-Proofpoint-GUID: tAEbuQ1MtzSUiNnTYB_p1TsO-WkqpW-K
X-Proofpoint-ORIG-GUID: 6RIwHFlDc0AvkcY7K17wZOEgBlHqxJCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_06,2022-10-19_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=846
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190067

On Wed, 2022-10-19 at 09:08 +0100, Daniel P. Berrangé wrote:
> I'd be inclined to not rely on guest networking, and probably even
> strictly decouple what the SVSM does to communicate, from any
> specific attestation server connection protocol or details.

I think we should be clear: if you need a secret at start of day,
before the guest boots, then you need to retrieve an attestation from
the SVSM and inject a secret.  If you can delay needing the secret
until after boot (say for data volumes) then you can use the cloud
standard methods we have today (which actually do mostly operate over
the guest network path) and a TPM which manufactures on boot.

However, the above mechanism is out of scope for the vTPM project. 
This is simply about putting a vTPM into the SVSM which appears in the
guest as a TPM and providing a guest API to retrieve its attestation. 
So the scope of the project ends there.

If we want a TPM with persistent state, then the state has to be
injected pre-boot but that is the same pre-boot problem as all secret
injection.  I think there should be a separate project working on this
and we'll make sure they interlock correctly.

So I think there are three pieces

   1. Ephemeral vTPM with attestation retrieved from guest
   2. Attestation and injection API from SVSM to host/guest end point
   3. SVSM API for saving TPM state

We'll work initially on 1. Someone else can work on 2. but we'll make
sure they fit together.  3. would be required for full TPM emulation,
but might not be required if all we want is persistence of the seeds of
the TPM, so this would be evaluated when we have 1+2.

James


