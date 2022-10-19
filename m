Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9602C2F33
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 20:57:06 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JKcaK9012710;
	Wed, 19 Oct 2022 20:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=udH7KakSEBiemTQ4vwZrzbsgXqfndd1ALZNSncfcnvM=;
 b=h3d8TdVbDUYCcEaZ6Q80/ZyRdNgVwWP1izCDChMKnQ4g7fMy02VUlCFVn4CISH88npvj
 2iBavMlBikQB2Z1vafSofSgm6YiusJAounngN+rtjfdFSRrn6CyDF+Sl4/QUd08BCl+K
 FIBIJK864Goz+tKzLPsXP6qSa2ibVSbNTLN75uJ3Ulo1NSakJzkMuMRM/g9Qvo2LTmsy
 ExhLTXkWBXTx44qNJtFDjUkhVISGF905yKKH8iBPhdQM+anrWuF2mLvwm50pk/FLq7jH
 sd/jOOy2xiEuBmuQMU+R8l21RNg7Ekids6adv5J2PXP41fvGAzJNXFs7C1W3GWo9Jty4 Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kapgjusm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 20:56:57 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JKpOP9024726;
	Wed, 19 Oct 2022 20:56:57 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kapgjuskv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 20:56:57 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JKoqTg018293;
	Wed, 19 Oct 2022 20:56:56 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma01dal.us.ibm.com with ESMTP id 3k7mg9c1ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 20:56:56 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JKusOn8454828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 20:56:54 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25E495805F;
	Wed, 19 Oct 2022 20:56:54 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D69145805D;
	Wed, 19 Oct 2022 20:56:51 +0000 (GMT)
Received: from [9.160.89.171] (unknown [9.160.89.171])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 20:56:51 +0000 (GMT)
Message-ID: <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
Date: Wed, 19 Oct 2022 23:57:00 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>,
        =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
        James Bottomley <jejb@linux.ibm.com>
Cc: Christophe de Dinechin <cdupontd@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        Dov Murik <dovmurik@linux.ibm.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
 <Y0+wcWgcRFTiDTNk@redhat.com>
 <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
 <Y0/2D93P/xgp1sU9@redhat.com> <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DSt5-cT8L6mvuQeDFZF2iRx_5YcJ2G5j
X-Proofpoint-GUID: M-Dqz7CA7ptuDn59fqvAQVTJwK0dlj_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_12,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190115



On 19/10/2022 17:43, Tom Lendacky wrote:
> On 10/19/22 08:05, Daniel P. Berrangé wrote:
>> On Wed, Oct 19, 2022 at 08:38:19AM -0400, James Bottomley wrote:
>>> On Wed, 2022-10-19 at 09:08 +0100, Daniel P. Berrangé wrote:
>>>> I'd be inclined to not rely on guest networking, and probably even
>>>> strictly decouple what the SVSM does to communicate, from any
>>>> specific attestation server connection protocol or details.
>>>
>>> I think we should be clear: if you need a secret at start of day,
>>> before the guest boots, then you need to retrieve an attestation from
>>> the SVSM and inject a secret.  If you can delay needing the secret
>>> until after boot (say for data volumes) then you can use the cloud
>>> standard methods we have today (which actually do mostly operate over
>>> the guest network path) and a TPM which manufactures on boot.
>>>
>>> However, the above mechanism is out of scope for the vTPM project.
>>> This is simply about putting a vTPM into the SVSM which appears in the
>>> guest as a TPM and providing a guest API to retrieve its attestation.
>>> So the scope of the project ends there.
>>>
>>> If we want a TPM with persistent state, then the state has to be
>>> injected pre-boot but that is the same pre-boot problem as all secret
>>> injection.  I think there should be a separate project working on this
>>> and we'll make sure they interlock correctly.
>>>
>>> So I think there are three pieces
>>>
>>>     1. Ephemeral vTPM with attestation retrieved from guest
>>>     2. Attestation and injection API from SVSM to host/guest end point
>>>     3. SVSM API for saving TPM state
>>>
>>> We'll work initially on 1. Someone else can work on 2. but we'll make
>>> sure they fit together.  3. would be required for full TPM emulation,
>>> but might not be required if all we want is persistence of the seeds of
>>> the TPM, so this would be evaluated when we have 1+2.
>>
>> Yes, that all makes sense to me as a division of concepts & work.
> 
> There was some offline talk about possibly putting the attestation
> report in the TPM NV area and allowing it to be pulled via TPM commands.
> However, if we want to be able to supply a new NONCE each time, I think,
> instead, that calls for it's own function in the SVSM vTPM protocol.
> 
> Currently, there are two functions in the vTPM protocol:
> 
>   1. An attestation report function
>      - Input:
>          - NONCE GPA (RCX)
>          - NONCE size (RDX)

NONCE size must be 32 (bytes)?
or 31 if we use the initial type byte (See below).

>          - Report destination GPA (R8)
>          - Report destination size (R9)
>      - Output:
>          - Result code (RAX)
> 
>      NONCE copied to SNP MSG_REPORT_REQ:REPORT_DATA[511:256].

James suggested:

[511:504] - type byte 0x00 = vtpm attestation report
[503:256] - 31 bytes nonce

> 
>      SHA-256 (EK Public Key | SRK Public Key) copied to SNP
>      MSG_REPORT_REQ:REPORT_DATA[255:0].
> 
>      On success, the report is present at Report Destination GPA.
> 
>      If a new way of creating REPORT_DATA is needed in the future, the
>      protocol could be extended with a new attestation report function
>      (following the SVSM Core Protocol design of being additive).


It's just a bit weird that the SNP attestation report function is part
of the vTPM protocol; but I guess that it is needed so we can
distinguish it from other future types of attestation reports (with
James's suggested "type" byte, which must never be user-controlled; it
must be set inside the SVSM).



Hmm, do we need also something like SNP_GET_EXT_REPORT which also
returns the cert-chain stored in the host kernel? Or modify this call to
also return the certs?



> 
>   2. A vTPM operation function
>      - Input:
>          - Command GPA (RCX)
>          - Command size (RDX)
>          - Response GPA (R8)
>          - Response size (R9)
>      - Output:
>          - Result code (RAX)
> 
>      On success, the result is present at Response GPA.
> 
>      @James Bottomley, I noticed in an earlier response that you had the
>      Response size as a possible output, is that needed? The response
>      output (header) contains the actual length of the response.
> 
> Are there any other functions that are needed?
> 

Looks good to me.  I think this is what we have in our prototype as well.

(But see my thought about equivalent of SNP_GET_EXT_REPORT.)

-Dov
