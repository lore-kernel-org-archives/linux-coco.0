Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF033C8
	for <linux-coco@lists.linux.dev>; Fri, 20 Jan 2023 17:10:45 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KH5w9D032079;
	Fri, 20 Jan 2023 17:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=YQR5Cm6A+i+bVqVniaNVZC6+jOKlNOYt1q6qARoBbP0=;
 b=IuQreoi/KPHaE2RSeezB1XpUjesFuTBfcB6GEWbnUiGw0CqEAF9pgska5upAt3qNxr7R
 mLDWTE76G7F0otH36VXZCN+4wQ/givYE1N5y+Fh1yx+CzRFRNCDK876JOZ4GqR+iiOCw
 84VYPGyCQ6hXEhlK9zhiayoV563lnv+rNwO98B/Ax4w78JRZjS9pZ++Z9lgK6rONOI5d
 GSq+je/VAHr2syLc1ssN7yFCBCulip7pJ93SDuGx7MUdMr3SBu6xEmhUQGyF6FmjesCN
 vPD4yDjU9yxubmEt8/p836bRrZGMMiL2zEmgNDZPke98v2IRNhOMhUqW7RV8Rqd9hqE2 xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7tfn76tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 17:10:39 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30KGqYP4014709;
	Fri, 20 Jan 2023 17:10:39 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7tfn76sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 17:10:39 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30KGFoJ5027310;
	Fri, 20 Jan 2023 17:10:37 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3n3m18bc3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 17:10:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30KHAaiD44171932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 17:10:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7EB77805E;
	Fri, 20 Jan 2023 18:54:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A3507805C;
	Fri, 20 Jan 2023 18:54:46 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.128.24])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 18:54:46 +0000 (GMT)
Message-ID: <a60f7cc2814b7d4bd7b4cc876634ff18276e0965.camel@linux.ibm.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
        Christophe de
 Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
        linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Date: Fri, 20 Jan 2023 12:10:34 -0500
In-Reply-To: <Y8qON8v5DmB+u9u3@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
	 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
	 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
	 <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
	 <Y8mztTGpZbWi89sn@suse.de>
	 <ad022a0c7cbe2b77da830e1bc0864d7841aab375.camel@linux.ibm.com>
	 <Y8pSzx1g8THT3rnC@suse.de> <Y8pXeZHY+bKQDen2@redhat.com>
	 <4086b1c3fc3f68b0dd0b0b9acf0c22256022efa1.camel@linux.ibm.com>
	 <Y8qON8v5DmB+u9u3@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nfGSH6hiyIMzFcsT9tXdbvTqcjDtJYMc
X-Proofpoint-ORIG-GUID: vHzKGNDInzq1Zm-Nk-SKinHjIz6x0uME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_09,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200163

On Fri, 2023-01-20 at 12:51 +0000, Daniel P. Berrangé wrote:
> On Fri, Jan 20, 2023 at 07:39:30AM -0500, James Bottomley wrote:
> > On Fri, 2023-01-20 at 08:57 +0000, Daniel P. Berrangé wrote:
> > > On Fri, Jan 20, 2023 at 09:37:35AM +0100, Jörg Rödel wrote:
> > > > On Thu, Jan 19, 2023 at 04:29:23PM -0500, James Bottomley
> > > > wrote:
> > > > > How can they stay there?  Even if the SVSM is the point of
> > > > > first contact to receive the secret, it must give the secret
> > > > > to higher VMPLs to try the mount, so the higher VMPLs have to
> > > > > destroy the secret they were given on failure.
> > > > 
> > > > My thinking was that the SVSM will only hand out the secrets
> > > > once the code in higher VMPLs has proven itself to be trusted.
> > > > But it is possible for an attacker to create an image with the
> > > > expected parts to get the measurements right and then use a
> > > > fall-back mount if decryption fails to steal the secret.
> > > 
> > > With a vTPM, and systemd-pcrphase.service, it is possible to seal
> > > secrets to prevent such an attack, by including phase=initrd in
> > > the sealing PCRs. IOW, nothing after the initrd can unseal the
> > > secrets, even if a different filesystem mount was substituted.
> > > 
> > > Secrets that are needed /after/ the root FS is mounted (eg SSH
> > > host key, Apache HTTP certs) can be sealed with a PCR set that
> > > covers the LUKS master key hash, so that they can only be
> > > acccessed if the correct rootfs was unlocked.
> > 
> > But that provides no additional security: the LUKS master hash is
> > just a hash of an area on the disk which anyone controlling the
> > device can see.  I can duplicate this area and still substitute my
> > own volume (which would still fail to decrypt when presented with
> > the key), so the trusted mounting component sill has to correctly
> > handle the failure case.
> 
> Yes, it would have to be a hash that is different from the
> hash that's exposed in clear text in the LUKS header.

True, but whatever thing you has hash to be available to the trusted
mounting entity before the secret is released, so all it can know are
what an observer can see ... there's no other thing you can hash that
the trusted mounting component knows that an observer can't see as
well.

>  For example it could be hash(master_key || uuid). 

The hash could only contain master_key if the secret is already
released, so you can't condition the key release on this hash.

James

