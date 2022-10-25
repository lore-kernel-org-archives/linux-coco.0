Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61C23AC
	for <linux-coco@lists.linux.dev>; Tue, 25 Oct 2022 14:14:06 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PDfI6n021475;
	Tue, 25 Oct 2022 14:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=vxCUTx8v5eudNN3GA2KJ5TtjaxOqOavRIY6AKp5FKAI=;
 b=FFUCDftIZgtz6R5JfGr8vZ04Qu4LdyT4XThbky8ia/vyHig5MzQwuf+De88yLJWOdcz5
 nI9yMOyI29Pc9/zKsUFeTH/e9B9JwFA42j3H/DiGLbJMU6Eo14BoLBt9aq+Y3jLpPNDF
 a5JgSj8F4L8ewTqnQbZJcWuhQS3CKOIGcdPdRAQc6akfk4WGFLBJ5XFBfG+XCGRYng0U
 XOaA5T3TSOK+vGT16fyNO51e2TWCgfRTzi521RIHzGLH+mOZD96pDgnYhYgaNbvszJlN
 W7neJ06SD2lRLX7fIEf+Ef0KwgFTsPj4UjRqbcET5OSXjRQYIpqnJXm1CvZnssT9OW44 Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kee35ypmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 14:14:03 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29PDfHVw021369;
	Tue, 25 Oct 2022 14:14:03 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kee35ypm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 14:14:03 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29PE5TBQ014963;
	Tue, 25 Oct 2022 14:14:01 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02wdc.us.ibm.com with ESMTP id 3kdytw07kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 14:14:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29PEE2rP21692824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 14:14:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A7797805E;
	Tue, 25 Oct 2022 14:57:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E157B7805C;
	Tue, 25 Oct 2022 14:57:30 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.163.14.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue, 25 Oct 2022 14:57:30 +0000 (GMT)
Message-ID: <461f5c5e76dc5280f25f4a8627188cb16b2c2f72.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Christophe de Dinechin <cdupontd@redhat.com>,
        Dov Murik
	 <dovmurik@linux.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
        "Dr. David Alan Gilbert"
	 <dgilbert@redhat.com>,
        Jon Lange <jlange@microsoft.com>,
        "Daniel P."
	=?ISO-8859-1?Q?Berrang=E9?=
	 <berrange@redhat.com>,
        David Altobelli <David.Altobelli@microsoft.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Tue, 25 Oct 2022 10:13:58 -0400
In-Reply-To: <m2bkq0i67q.fsf@redhat.com>
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
X-Proofpoint-ORIG-GUID: 4DQ2oY3eYd2ylbztOf6h4KSOOUvlcSEA
X-Proofpoint-GUID: 4MNqvM0pb-PWxvZUcRPjB5gRRG-3lDj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_06,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=989
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210250081

On Tue, 2022-10-25 at 11:43 +0200, Christophe de Dinechin wrote:
> On 2022-10-25 at 11:51 +03, Dov Murik <dovmurik@linux.ibm.com>
> wrote...
> > On 24/10/2022 22:02, Tom Lendacky wrote:
> > > On 10/24/22 06:45, Dov Murik wrote:
> > > > 
> > > > On 24/10/2022 13:59, Dr. David Alan Gilbert wrote:
> > > > > * Jon Lange (jlange@microsoft.com) wrote:
> > > > > > The drawback to having an identifier-prefixed document is
> > > > > > that it necessarily restricts each report to providing only
> > > > > > a single statement from a single SVSM protocol.  If, in the
> > > > > > future, we find it is common for a relying party to
> > > > > > require, say, five different protocol statements, this
> > > > > > imposes a requirement to obtain five separate reports. 
> > > > > > This means a minimum of five round trips from the SVSM to
> > > > > > the PSP, which seems undesirable.  I think we will really
> > > > > > want to invest in defining an extensible format that can be
> > > > > > placed into a single report.  I'm not claiming that JSON is
> > > > > > the only option here, but I think we will regret any format
> > > > > > that prevents extension within a single report.
> > > > > 
> > > > > Having something structured does seem to me better than
> > > > > tacking a magic byte on. (Although as I remember, the SNP
> > > > > report already contains a flag saying which VMPL level the
> > > > > request was generated from; whether that's enough to
> > > > > discriminate between guest requests, and requests by the
> > > > > firmware I don't know).
> > > > > 
> > > > 
> > > > The VMPL level is not enough to distinguish between different
> > > > reports which all originate from the SVSM (for example, let's
> > > > say we have an SVSM-vTPM report and an SVSM-migration-helper
> > > > report).
> > > > 
> > > > I think that the two options presented here are:
> > > > 
> > > > 1. SNP REPORT_DATA = type_byte + nonce + sha256(extra_data)
> > > > [James]. The meaning/format of extra_data depends on
> > > > type_byte.  For now we design just for vtpm (type_byte=0x00). 
> > > > In the future, adding more info (like migration-helper report)
> > > > will use new type_byte values (0x01,
> > > > ...).
> > > > 
> > > > 2. SNP REPORT_DATA = nonce + sha256(extra_data) [Jon].
> > > > extra_data is a JSON document which may contain a vtpm section,
> > > > a migration-helper section.  In the future, we can add more
> > > > info but adding sections to this JSON document.
> > > 
> > > If I understand this method correctly, the input would be a JSON
> > > document requesting certain elements (a one-to-one relationship
> > > or a one-to-many?) and their values be used in generating an
> > > output JSON document, correct?
> > > 
> > > That would mean parsing the input document in the SVSM. The SVSM
> > > would return an error on improper documents. What about
> > > unidentified fields, would those just be returned with null for
> > > their values or not included in the output document?
> > 
> > You mention "input document" -- who would provide it?

I think you have to be more precise about "it".  There are two
potential types of "it": one is the template you want the SVSM to fill
in and the other is the JSON document with the values.  I can't really
see why we'd provide the latter to the SVSM because why would it
believe our values without checking them and if it knows enough to
check them why does it need them passed in?

The next problem is there might be values in the template only the SVSM
knows (this isn't the case for the TPM, but it might be true for the
migration parameters).

> 
> In the migration-helper case, the migration helper data would not
> originate from the SVSM itself, would it? So I guess it would have to
> be provided, presumably in JSON form.

Just from a security point of view, you never want any attestor to
attest to information it doesn't itself know.  Thus the only input
information from an unverified source should be the challenge (the
nonce).  If there's information about the migration the SVSM doesn't
know and can't verify, it shouldn't be part of the report.

> 
> In other words, I think long term, the SVSM would need to parse
> _some_ input, but this is a problem we can defer until we actually
> need it.  For the first iteration, we can certainly generate the
> “base” JSON entirely from the SVSM. I think both statements are true
> irrespective of the approach chosen.
> 
> But Dov's question points to more than just parsing. If the SVSM were
> to hold information such as migration helper data, we then have to
> think about storage in the SVSM, e.g. what is maximum size of
> migration helper data.  Or alternatively, formulate the interface in
> such a way that it's the caller's responsiblity to provide "fill-in-
> the-blanks" JSON data with space for the vTPM data, in which case we
> are back to having to parse JSON input.

Well, no, I don't think you need to do either.  The SVSM has a 32 bit
protocol definition.  You can just define a new protocol to produce the
migration report and that can have different input arguments if
necessary (migrations would need some form of attestation from the
remote that the local SVSM can verify, so they need more information
than the SVSM knows at the time).  This does mean that you don't
necessarily need an input template unless you want to do multiplexed
reports, which is a decision I'd punt on until a need arises, so I'd
still keep the SVSM attestation report as not having an input template.

As for storage, the SVSM has access initially to all the memory of the
VM before it begins OVMF, so it can just take possession of anything it
needs.  I don't believe at this size we need to design a maximum size
... lets see first what uses appear.

> I tend to agree that we'd better think about this scenario ahead of
> time, just to make sure we can cover it properly in both approaches.

Well, yes and no.  You don't have to boil the ocean designing this, you
just have to know that the design you chose is extensible (as both
proposals seem to be).

James


