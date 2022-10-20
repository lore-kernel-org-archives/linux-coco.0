Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8917E
	for <linux-coco@lists.linux.dev>; Thu, 20 Oct 2022 20:29:43 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KKCVvM016785;
	Thu, 20 Oct 2022 20:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : from :
 reply-to : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding : subject; s=pp1;
 bh=BovbuLnzI+zYptgO/uNg6CBAePnqGIV+yx17mARMW3s=;
 b=klV0wbO6yKahK2Y/hx67PbLX7TYxuwxSoD/pyIgPcTdjxUGAPtwvBJVf7dS1BK2XIqwm
 +hneNQEUxM4l74exCn2PQJIzYzJ7qWTCYoijapPYP7v5x03HVVJwvHGeSjxVmO+vZ9ae
 UF8/jRAyD6igcunlaM58YDb+vD1Kpy2MqxWrGUjaWhmtyw4nFo8kaN3GxvHsXQiFuLcq
 ToxaMCDaTg7AYz5gxPKyS0CxL2lFUFPecbQnjAzHV637TPIQ/Qnv6ayz2BbVxL3ZLKEl
 EYqPMe2EMsiMQ3sVtycLgSpB6fnNev7TCZR/2KQfPr7JOdO+kmFssgd8X+tvRGp9wTC3 Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbcymruya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 20:29:40 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KKDgp3022002;
	Thu, 20 Oct 2022 20:29:40 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbcymruxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 20:29:40 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29KKLqZR028227;
	Thu, 20 Oct 2022 20:29:39 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma03wdc.us.ibm.com with ESMTP id 3k7mga2f8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 20:29:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29KKTdco36897034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Oct 2022 20:29:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F13F77805E;
	Thu, 20 Oct 2022 21:09:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1B097805C;
	Thu, 20 Oct 2022 21:09:51 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 21:09:51 +0000 (GMT)
Message-ID: <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: David Altobelli <David.Altobelli@microsoft.com>,
        Steve Rutherford
	 <srutherford@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
        Dov Murik
 <dovmurik@linux.ibm.com>,
        "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
 <berrange@redhat.com>,
        "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com"
 <amd-sev-snp@lists.suse.com>,
        Christophe de Dinechin <cdupontd@redhat.com>
Date: Thu, 20 Oct 2022 16:29:35 -0400
In-Reply-To: <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
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
X-Proofpoint-ORIG-GUID: uQ3PYO60Uzqc1qZynOaJZieblj7VclF4
X-Proofpoint-GUID: -MelP8JsW7het7ye_nCJjywFnAjgkOb8
Subject: RE: SVSM vTPM specification
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_10,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200118

On Thu, 2022-10-20 at 19:58 +0000, David Altobelli wrote:
> From: Steve Rutherford <srutherford@google.com>
> 
> > I'm a little leary of JSON in the SVSM. My fears of JSON parsers in
> > high trust tools might be unfounded though. Broadly speaking, the
> > idea of having something that contains what was >hashed would be
> > nice for future proofing. Having flexibility in which keys/data are
> > hashed into the report seems wise.
> I'm partial to JSON, but any format would do.  If parsing is
> problematic, outputting JSON data doesn't actually require parsing,
> it's just formatting some strings.

I too would prefer a format whose hash doesn't depend on how you
canonicalize it.

> > Separately, it's not clear to me why we need to attest to the SRK.
> > My understanding was that it was primarily used locally, and that
> > attestation was the job of the endorsement hierarchy. >Once you
> > have an EK, you can go through the necessary motions to certify the
> > SRK. That said, I can imagine wanting the hash of a standardized
> > AKpub to simplify those flows.
> Agree on not needing SRK, and AKpub (or AIKpub) being
> interesting.  Maybe there are some core claims that every
> implementation would want to offer, along with whatever optional
> claims improve their scenario?

Getting a TPM to certify a SRK given EKpub isn't simple.  You have to
create an AK in the TPM; do a make credential/activate credential round
trip on the AK to verify it against EKpub and then use the AK to
certify the SRK.  We could short circuit this if the EK were a signing
key ... then it would be able directly to certify the SRK.

James


