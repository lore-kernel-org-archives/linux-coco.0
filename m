Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06BD3732E
	for <linux-coco@lists.linux.dev>; Wed,  7 Jun 2023 17:12:39 +0000 (UTC)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357HA84o032229
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 17:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0NKBqOP8FbzQ/55yNAa4eAI6LOP6DmwbEimj9XNwvVU=;
 b=KvZtw4NixpKYspsDUcZMHWOkSEDlwykGTLqgTyDoa97U35hk6z6RSX7rOUMPhuRXlxmO
 KoHy4emsA2M4RBEeY1QsDjf9+KlGklroSO1B6pnfrvrTj3vBt2kyvp5z+tjnU90eU4ge
 /PCIZOVKPQ9hcQ08+xo2Qky6Jw02iCem+WshQebY1nBYYdvDasTpP9bYDXGqfPC82ek1
 2pAFIB28hsQHK9AP8Pte/59165gFzsX8OrwzBgWFbZhH8EVpD+nvNxwfT1AcPlhvSK4M
 yun2j/HDMtFKWqJ+SNoU+m8O3yZ38sdYQrk8+qw8bKpfVBowEDEuzkuAuu5OpAzPOzHn OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2wqr0kh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 17:12:37 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 357HAR0I002416
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 17:10:59 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2wqr0fwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 17:10:59 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 357GkIWR032105;
	Wed, 7 Jun 2023 17:05:19 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3r2a76q5ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 17:05:19 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357H5GLo44106086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 17:05:17 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D99F15805D;
	Wed,  7 Jun 2023 17:05:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39FA358065;
	Wed,  7 Jun 2023 17:05:15 +0000 (GMT)
Received: from [9.171.24.85] (unknown [9.171.24.85])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 17:05:15 +0000 (GMT)
Message-ID: <c344c4ae-8a6f-a02d-453d-3980e28a64ec@linux.ibm.com>
Date: Wed, 7 Jun 2023 20:05:13 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC PATCH 3/3] virt: sevguest: Add support to get attestation
 report from SVSM
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: linux-coco@lists.linux.dev, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Claudio Carvalho <cclaudio@linux.ibm.com>,
        Dov Murik <dovmurik@linux.ibm.com>
References: <20230607150646.97208-1-dovmurik@linux.ibm.com>
 <20230607150646.97208-4-dovmurik@linux.ibm.com> <ZICu5fmlC8QeqFbO@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <ZICu5fmlC8QeqFbO@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8VgAxrRaM96AIg69wAA-e7NjnqDMCKoO
X-Proofpoint-ORIG-GUID: Xm0P_9odXv2hAL0FUm9wSRj93jbQgvbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_09,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=841 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070146

Thanks Daniel.

On 07/06/2023 19:23, Daniel P. Berrangé wrote:
> On Wed, Jun 07, 2023 at 06:06:46PM +0300, Dov Murik wrote:
>> Expose SNP_SVSM_ATTEST_SERVICES ioctl function which allows userspace to
>> retrieve SNP attestation report.
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
>>  drivers/virt/coco/sevguest/sevguest.c | 95 +++++++++++++++++++++++++++
>>  include/uapi/linux/sev-guest.h        | 34 ++++++++++
>>  2 files changed, 129 insertions(+)
> 
> Appreciate it is just an RFC right now, but the ioctl will eventually
> need documenting at Documentation/virt/coco/sev-guest.rst
> 

You're right.  Currently I developed this to help me test the SVSM
implementation of the attestation protocol.  I'm sure there are other
debug leftovers in this series...

It was easy for me to add another function to the existing driver
(sev-guest), but maybe there's a benefit to separating this to a new
virt/coco/svsm-guest driver with its own ioctls, and autoload it when
kernel is running under SVSM.

I'll leave these options open; main focus should remain on SVSM itself
and its near future development directions.

-Dov
