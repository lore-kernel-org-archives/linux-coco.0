Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E48F71
	for <linux-coco@lists.linux.dev>; Fri, 21 Oct 2022 13:05:24 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LCfhvC023384;
	Fri, 21 Oct 2022 13:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : from :
 reply-to : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding : subject; s=pp1;
 bh=EcJCh836lgEyDVmuYoVf6+o0ddN8j8cSRlVcsDTgULI=;
 b=RvrF4ja8Hquo+bSUXzdAhWHVRzhJlbLSETtVjHiI041Acl16sr+BM6Wy7aq5eHHQ7lj6
 f5s1VPDbngdcZNgzAsrzKJRBBmdmhkX6LjQ+SISOgQ/N5nIyAlZEoqPzE6xQGeKKa4N6
 pAfzTux2ii6tauxGeZMm9wHuEcDd4I+b9dhu4vDi4dzKNsBLEzYUL8v2LGPpbnBwmp8I
 4PIaXmCxM3v0ezdav6x3s9XYykbT77DdMaCkWMt97KLuggBYV7p6odC75q29NdN4MmyR
 r9SiGddy6zVqiBOY+LfWl+WTFh4pL09iZpEd2InjLmh0bM1SDgvdS+yDye9DUaHjF/FC 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbund9227-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 13:05:15 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29LCgZiu028349;
	Fri, 21 Oct 2022 13:04:47 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbund90ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 13:04:46 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29LCoGX3018698;
	Fri, 21 Oct 2022 13:04:16 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma05wdc.us.ibm.com with ESMTP id 3k7mgah3j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 13:04:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29LD4E3f9372168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Oct 2022 13:04:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 975A77805E;
	Fri, 21 Oct 2022 13:44:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66CEC7805C;
	Fri, 21 Oct 2022 13:44:57 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 21 Oct 2022 13:44:57 +0000 (GMT)
Message-ID: <7e67f33577aaebe09205c9a93597de9f742fd08f.camel@linux.ibm.com>
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Jon Lange <jlange@microsoft.com>,
        David Altobelli
	 <David.Altobelli@microsoft.com>,
        Steve Rutherford <srutherford@google.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        Christophe de Dinechin <cdupontd@redhat.com>,
        "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com"
 <amd-sev-snp@lists.suse.com>
Date: Fri, 21 Oct 2022 09:04:12 -0400
In-Reply-To: <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
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
	 <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
	 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
	 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
	 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
	 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
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
X-Proofpoint-GUID: -gdRRIp4DvHX17rvRbqKM7ffvtL6VFU5
X-Proofpoint-ORIG-GUID: e_6Wf2P2cwbBqv-FKrOKqMH8aPVXvBfZ
Subject: RE: SVSM vTPM specification
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=714 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210078

On Fri, 2022-10-21 at 00:02 +0000, Jon Lange wrote:
> Surely the primary value of a document hash is to prove its
> authenticity, not to determine whether two documents reflect
> identical information.  I understand your concern that two
> "canonical" representations of the same data may result in different
> JSON encodings and therefore produce different hashes, but as long as
> each document can be authenticated by its hash, does it really matter
> if the hashes of the two documents are different?

If you only have an AMD-SNP attestation report and access to the vTPM,
you have to query the TPM properties then construct and hash the
document yourself to verify the report.  I sometimes think half the
history of security protocol implementation consists of one engineer
struggling to reproduce the hash created and signed by another, which
is why I have a preference for it being exactly specified and simple.

> There is a ton of discussion here about vTPM because it's an
> important problem, and it is valuable to recognize that a vTPM
> implementation will likely require some sort of SVSM-issued document
> to describe that vTPM.  There's no reason to back away from defining
> the structure of such an SVSM-issued document.  But we should also
> expect that in the next 2-3 years, we're going to invent other
> valuable functionality that an SVSM can implement that will also
> require the SVSM to issue some sort of authenticated statement.  If
> we marry the SVSM report information to a vTPM, then it's going to be
> really hard to add that new functionality, and if we don't anticipate
> the need for extensibility, then we're going to wind up in a future
> where an SVSM will issue different kinds of authenticated information
> (vTPM on one hand and new feature on the other) and the relying party
> won't be able to know which is which.  I don't see how we can avoid
> the problem of defining an extensible document schema now that we can
> extend in the future as the role of the SVSM expands.  JSON is an
> extremely attractive syntax for such a schema - certainly much more
> so than XML, and also likely to fare much better than any binary
> standard.

Allowing the relying party to know what type of authentication was why
I proposed a type prefix to the guest data in the report.  The reason I
like the type in the guest data and not the hash is so the bare report
is self identifying even if it costs us a byte or two of the nonce.

There are 2^32-1 possible SVSM protocols, so nothing in the above
precludes adding a json based hash call if a need arises (or indeed
many other binary/json/xml ones if that's what people prefer).

James


