Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E0A7C
	for <linux-coco@lists.linux.dev>; Tue, 20 Sep 2022 20:29:23 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KK9fYa002235;
	Tue, 20 Sep 2022 20:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : cc : subject : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=vRG2+7LNEOHYJKjmqt/jfyRt1/vulWysKiUMjbYYcDg=;
 b=X3dCryrzJe4ZVaGtDvFY8byQtXfyKV01GrlIsstsx2MgiAaRU7xkswFDWkx5xPIruwQM
 lu3us3f/iAGG+e4TQOvuNYJq+uzqL42432aalJBSQTOg4DzDvDUabL4OgMuTOyacrCC1
 uVVyk5EaZm+UdDrShhNXtndDoyHhoiVCAQR9m5bOHmvOOMfSWd+XVibTvVjIW6KV9e+F
 PlcxDGOMlXK1RKAd9J0XXEr0VhsudDJvx4i+U1P1m3nVTzwSCOBnjLUpGure7VyWYnR3
 st2biGqt8Stz6jvAbd88/iylgMiVT7CYJpGqKsi9cTpbhuBIjKD85uzoq3XlQ4vWeLKr KA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqm6g0q65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 20:29:22 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KKKLY3010675;
	Tue, 20 Sep 2022 20:29:22 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqm6g0q5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 20:29:22 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28KKKHxa011436;
	Tue, 20 Sep 2022 20:28:21 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma01dal.us.ibm.com with ESMTP id 3jn5v9uaxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 20:28:21 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28KKSIws37945700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Sep 2022 20:28:19 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61D6658057;
	Tue, 20 Sep 2022 20:28:19 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC8EB58059;
	Tue, 20 Sep 2022 20:28:17 +0000 (GMT)
Received: from [9.160.86.51] (unknown [9.160.86.51])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Sep 2022 20:28:17 +0000 (GMT)
Message-ID: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>
Date: Tue, 20 Sep 2022 23:28:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: linux-coco@lists.linux.dev
From: Dov Murik <dovmurik@linux.ibm.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>, amd-sev-snp@lists.suse.com,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Subject: Secure vTPMs for confidential VMs
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MOHvVG8U0wF3AFtNFrxsGWbzxd0G5Fkb
X-Proofpoint-GUID: 5oKJRQF68MgthLhGMLQO-O32Mv_B83E7
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_10,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209200121

Hello,

Tobin and I gave a talk in KVM Forum 2022 last week about Unifying
Confidential Attestation [1].  During the KVM Forum and Linux Plumbers
2022 we had several conversations with various attendees about using
secure virtual TPMs to attest confidential VMs.

We want to use the linux-coco mailing list to start community discussion
about various options and tradeoffs for implementing secure vTPMs.

Emulating hardware TPMs has an advantage that guest software already
uses TPM devices to measure boot sequence components (firmware,
bootloader, kernel, initrd) and runtime events (IMA in Linux).  We know
that this currently works with vTPMs backed by the VMM implementation,
such as QEMU's tpm device which is connected to swtpm running on the
host.

As far as we know, current vTPM solutions are insecure in the
confidential computing setting, because the TPM code is running on the
untrusted host, and communication between the guest and the TPM
component is visible and modifiable by the untrusted host.  This allows
the untrusted host to fake measurements or steal sensitive keys from the
TPM memory/NVDATA.

We so far recognized three issues that should be further researched in
order to implement secure vTPMs for confidential VMs; these are TPM
provisioning, implementations in TEEs, and guest enlightment.

* TPM provisioning: The TPM contains sensitive information such as EK
private key which should not be accessible to the host and to the guest.
How should such information be delivered to the vTPM when starting a new
VM?  If we provision encrypted NVDATA, who has the key to decrypt it?
If we provision it with "classic" TEE secret injection, we need to do it
quite early in the VM launch sequence (even before the firmware starts?).

One suggestion is to use an ephemeral EK, generated at launch by the
vTPM.  The system may start to boot using such a TPM, but once we want
to unseal secrets (for example, to unlock a LUKS partition), we need
something persistent inside the TPM (or re-seal the key for each TPM).
Ephemeral TPMs might be a useful first step.

* Implementation in TEEs: SNP introduced VPMLs, and AMD's linux-SVSM
running in VPML0 can also run vTPM code to handle TPM requests from the
guest running in VMPL1.  Such a solution is not applicable as-is to
other TEEs (SEV, TDX).  People suggested running vTPMs in a separate
confidential VMs, and somehow connect the tenant's guest to the TPM VM;
but we'll need a way to secure this communication channel.

* Guest enlightment: Guest software currently interacts with the TPM by
writing commands to a memory-mapped IO page (GPA 0xfed40000) and reading
responses from that page.  We want such writes to trigger the code of
our vTPM (for whatever implementation we choose).  Our current early
experience with TPM running in linux-SVSM required adding "exit-guest"
calls after writing commands to the IO page, in order to allow the SVSM
to run and recognize the incoming command.  Ideally, we'd like a
solution that doesn't require modifying all the TPM drivers out there
(in Linux, Windows, OVMF, grub, ...).

We're sure there are other issues as well, but these are the main ones
we encountered so far.  We'd like to hear the community's feedback and
ideas as early as possible.


Thanks,
Tobin and Dov.

[1] https://static.sched.com/hosted_files/kvmforum2022/02/Unifying-Confidential-Attestation-KVM-Forum-2022.pdf
