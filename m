Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2725E7474
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 22:15:08 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30AKC2ii012908;
	Tue, 10 Jan 2023 22:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=hI4+LdIBl6cBWtAxmfpdt8nnMJpV4NroAqsfgFg6kjg=;
 b=qbgNcOHcSZzaY2GvRQhiIt5zJ3yap/55GJSkFq8fGIXz63KjMFE7YVrKoP+0fDEtKyhZ
 skGhXbxKkSGDoor6Fxen5VN7si7mUn/b+SpB03NoWpGiikArUW9Ht4vbCKAury8LdYSm
 cVC2003f2uhGQMKeFiydftuHRmUGn2fC22TB1IiFGS/hr6JrYM+Lg4vFpxO7rYinP830
 CvFOHYOcPF1k/+Q0Yqez71KQ/0aTnxyZCSEfoGHupYuZdaCLpQuYytmS4vR2fT3yB2jF
 OUVGgZVzzCnH/iOc0obmnngTAz73IcLwBC7YpWm/ISewB6CHBWHwIWwtyqdlsIFyeXq9 AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1euj2jps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 22:14:59 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30AME5B9023502;
	Tue, 10 Jan 2023 22:14:58 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1euj2jpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 22:14:58 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30AKFwP8007514;
	Tue, 10 Jan 2023 22:14:57 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3my0c7s6r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 22:14:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30AMEthR3867340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jan 2023 22:14:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F4F67805E;
	Tue, 10 Jan 2023 23:52:17 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EDC67805C;
	Tue, 10 Jan 2023 23:52:16 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jan 2023 23:52:16 +0000 (GMT)
Message-ID: <82e9126149127c11a09bf031125edf2ee72a7a26.camel@linux.ibm.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Tom Lendacky <thomas.lendacky@amd.com>,
        Dionna Amalie Glaze
	 <dionnaglaze@google.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Tue, 10 Jan 2023 17:14:53 -0500
In-Reply-To: <804079b5-c090-af4b-ecca-839ab8bea0f7@amd.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <CAAH4kHa_DN2e4DreB_PfUEsu7KrB64=m5=-HnH+WpnmecoRz3g@mail.gmail.com>
	 <804079b5-c090-af4b-ecca-839ab8bea0f7@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sHyv_YK2tWhSsmw29ffJJjSy91PevVO8
X-Proofpoint-ORIG-GUID: lnHcbFCrcQfQr7o9X8hzdZ03QHsOCEKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_09,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100145

On Tue, 2023-01-10 at 15:03 -0600, Tom Lendacky wrote:
> On 1/10/23 13:40, Dionna Amalie Glaze wrote:
> > typo: "oridnal"
> 
> Will fix.
> 
> > 
> > For the statement "Locality usage for the vTPM is not currently
> > defined." should this be interpreted as version 1 of the vTPM
> > protocol will not support locality, or simply that version 1 might
> > have the affordance to add behavior for non-zero locality in a
> > future revision of version 1, such that the result is not specified
> > as SVSM_ERR_INVALID_PARAMETER? I think the latter is probably a
> > dangerous interpretation unless v0.60 of this document is strictly
> > considered "unstable" and shouldn't be used upstream, so I'd
> > recommend clarifying that "currently" in a document that might
> > later be outdated should be precise about its specified behavior in
> > a versioned fashion.
> 
> Version 1 of the vTPM protocol will not support locality, so I'll
> remove the "currently." If locality is to be supported, it would be
> in a post version 1 of the vTPM protocol and will likely require
> invoking a new call id (unless we somehow manage to figure out
> locality before v1.0 of the SVSM specification).

Actually, that's not entirely correct:  The current SVSM vTPM
implements locality as a number just fine.  However, if all TPM
consumers can access all localities without restriction locality
becomes a totally useless thing.  To give a meaning to locality, you
have to have some restrictions about how components can access it.  The
only current user of localities I know is dynamic launch and that's
usually done by restricting locality 4 to the CPU microcode in a
physical system.

Until we can agree what dynamic launch (or some other locality
consumer) might mean in a confidential VM (and that the SVSM can police
it) there's no real point wiring locality up in the linux kernel
driver.  I mean the linux kernel itself doesn't use localities either,
it just sets them to 0 unless the TPM indicates a different default
value.

If we do find a use for localites, whatever we use them for would be
described by TPM event log entries, so there would be no need of a new
versioned SVSM call.

James

