Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4517C1
	for <linux-coco@lists.linux.dev>; Mon,  3 Oct 2022 07:43:09 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2937Iws0009199;
	Mon, 3 Oct 2022 07:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DnVddkJzPowxaG4HQs+6VvurJqMs78Edy2usS2A83ws=;
 b=qGpalnlAgKVK5MNMH6ihDKaynGLAqyWSrBT6DZAzyyf7zR/bhRNGIvuIT8bcb/oryZOY
 Vva9xjabBSVLnqXqlIizHA3f2EpuOVTlrMvaWu9xwiiKLL0wDaD80QBa2N5M8TUmRzJr
 lqN20vAzn47SQBBXHR3uEKeyUbIc66pQSMhxv9rrFeYIHMLzxwF37IdQoAbajXa1ygHG
 w1ktCXm32TeJklEZDNd2RKJliOdIt2Y+/lV9ogaK4z8rihD7z1T0QCTI24zCJOGvVKvW
 bl2AkrH2O9T1ginlVq+SH8KQN5xoOgq7dy24bXZc8ka8PDnYOEPeAZwt1m200u7cWiRj kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jyu80gpks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Oct 2022 07:43:03 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2937JgEF011243;
	Mon, 3 Oct 2022 07:43:02 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jyu80gpkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Oct 2022 07:43:02 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2937aUhL028725;
	Mon, 3 Oct 2022 07:43:01 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma01wdc.us.ibm.com with ESMTP id 3jyqads8gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Oct 2022 07:43:01 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2937h08P11272876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Oct 2022 07:43:01 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D09CB58056;
	Mon,  3 Oct 2022 07:42:59 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DEC95803F;
	Mon,  3 Oct 2022 07:42:58 +0000 (GMT)
Received: from [9.148.12.134] (unknown [9.148.12.134])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Oct 2022 07:42:58 +0000 (GMT)
Message-ID: <15bbd65d-6d63-3346-831f-3fddfcc37bee@linux.ibm.com>
Date: Mon, 3 Oct 2022 10:42:55 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: Secure vTPMs for confidential VMs
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: linux-coco@lists.linux.dev, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>, amd-sev-snp@lists.suse.com,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Dov Murik <dovmurik@linux.ibm.com>
References: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>
 <YyrbDbB1HJ9juGV1@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YyrbDbB1HJ9juGV1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HdVpDT-DBYnPFaFxRyFf67h6ogPRPVlj
X-Proofpoint-GUID: ZjQAAV5GqmEHNQJ8fKlQti8uvVYRE44_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030044



On 21/09/2022 12:36, Daniel P. Berrangé wrote:
> On Tue, Sep 20, 2022 at 11:28:15PM +0300, Dov Murik wrote:
>> Emulating hardware TPMs has an advantage that guest software already
>> uses TPM devices to measure boot sequence components (firmware,
>> bootloader, kernel, initrd) and runtime events (IMA in Linux).  We know
>> that this currently works with vTPMs backed by the VMM implementation,
>> such as QEMU's tpm device which is connected to swtpm running on the
>> host.
> 
> Leveraging pre-existing support in guest OS feels pretty compelling.
> It is apparent that there is alot of maintainer activity across pieces
> of the Linux software/distro stack in relation to improving support
> for SecureBoot and (v)TPMs in general. Being able to take advantage of
> this would be good for confidential computing, by reducing the burden
> on software/distro maintainers, and giving users technology that they
> are (in theory) at least somewhat familiar with already.
> 

We see from discussions here that there are several layers in which we
can leverage pre-existing support in guest OS.  One would be to emulate
the TPM behaviour at the MMIO level, so writes from the OS to the MMIO
page will be captured and handled by the SVSM vTPM.  Another approach
would be to add another TPM low-level driver to the guest OS, which will
use proper guest-to-SVSM communication.  Maybe there are other ways.

In both cases, most of the OS code is unchanged: for example the use of
TPM in IMA and in trusted-keys.



> If we can drive the confidential compute specific bits, including
> the attestation of the confidential hardware, from the guest firmware,
> then it ought to make it easier for guest OS images to be agnostic as
> to whether they're running a non-confidential or confidential VM.
> 
> It becomes more of a deployment decision for the user of whether to
> use a confidential VM or not at any launch attempt. eg they could
> have 1 image and run it in a non-confidential VM on their internal
> cloud, while using a confidential VM on public cloud when needing
> to scale their resources.
> 
> 
> This would not be so straightforward with some of the alternative
> proposals for confidential VM disk images. For example another
> proposal has been to have a bootloader like grub embedded in the
> firmware, such that even /boot is encrypted in the disk image and
> gets keys provided for unlock prior to the OS being launched.
> 
> This would make that disk image inherantly incompatible with use
> in non-confidential VM, as well as requiring OS vendors to ship
> even more different cloud disk image variants, and support different
> boot processes in their software stack.
> 
> 
> So overall I'm heavily attracted to re-using existing technology
> to the greatest extent that is practical. It makes confidential
> computing "normal" and will facilitate its uptake.
> 
>> We so far recognized three issues that should be further researched in
>> order to implement secure vTPMs for confidential VMs; these are TPM
>> provisioning, implementations in TEEs, and guest enlightment.
>>
>> * TPM provisioning: The TPM contains sensitive information such as EK
>> private key which should not be accessible to the host and to the guest.
>> How should such information be delivered to the vTPM when starting a new
>> VM?  If we provision encrypted NVDATA, who has the key to decrypt it?
>> If we provision it with "classic" TEE secret injection, we need to do it
>> quite early in the VM launch sequence (even before the firmware starts?).
> 
> For it to be transparent to the guest OS, then the vTPM state would
> need to be unlocked prior to the guest OS being launched. This points
> towards the confidential VM firmware triggering an initial call to the
> attestation service, and receiving a key to unlock the vTPM state
> as a response.
> 

Indeed.  Implementing this requires very early communication with the
Guest Owner's Key Broker Service, which will probably need to be routed
through the host with the VMM's help.  We've previously discussed ways
to do this for SEV's pre-launch attestation flow (I think you suggested
using libvirt as part of the proxying solution); it seems that similar
mechanisms would be needed for SNP/TDX as well if we need to communicate
with the Guest Owner before the guest OS starts and sets up its network
stack.

Maybe a vsock would be helpful here to communicate with the host, but
AFAIK OVMF doesn't currently have a virtio-vsock driver... Another
approach is to define a shared page for guest-host communication, and
maybe even use the existing QEMU SEV commands for retrieving the
attestation and injecting the secrets (but with a different underlying
implementation).

-Dov

> It is likely that the guest OS owner would want the option to perform
> another attestation later in boot, to validate the broader OS userspace
> boot status.  IOW, the firmware initiated attestation handles aspects
> specific to bootstrapping the confidential VM environment, while an OS
> initiated attestation would handle the generic (pre-existing) use cases
> for OS state validation, familiar to anyone already using (v)TPMs.
> 
>> One suggestion is to use an ephemeral EK, generated at launch by the
>> vTPM.  The system may start to boot using such a TPM, but once we want
>> to unseal secrets (for example, to unlock a LUKS partition), we need
>> something persistent inside the TPM (or re-seal the key for each TPM).
>> Ephemeral TPMs might be a useful first step.
> 
> If the motivation for using vTPMs is to take advantage of pre-existing
> TPM support in guest OS, then IMHO we should be aiming for the vTPM to
> be on a par with a vTPM from a non-confidential VM / bare metal.  An
> ephemeral only vTPM would loose some (but not all) of the benefit of
> targetting pre-existing TPM support in guests.
> 
> 
>> * Implementation in TEEs: SNP introduced VPMLs, and AMD's linux-SVSM
>> running in VPML0 can also run vTPM code to handle TPM requests from the
>> guest running in VMPL1.  Such a solution is not applicable as-is to
>> other TEEs (SEV, TDX).  People suggested running vTPMs in a separate
>> confidential VMs, and somehow connect the tenant's guest to the TPM VM;
>> but we'll need a way to secure this communication channel.
> 
> TDX is obviously an important target, but I'm not sure its worth
> worrying too much about SEV/SEV-ES as that generation is inherantly
> limited & flawed compared to current SEV-SNP. The ony thing in favour
> of SEV/SEV-ES is broader hardware availability today, but that will be
> a time limited advantage that's eroded as SEV-SNP deployment expands. 
> 
>> * Guest enlightment: Guest software currently interacts with the TPM by
>> writing commands to a memory-mapped IO page (GPA 0xfed40000) and reading
>> responses from that page.  We want such writes to trigger the code of
>> our vTPM (for whatever implementation we choose).  Our current early
>> experience with TPM running in linux-SVSM required adding "exit-guest"
>> calls after writing commands to the IO page, in order to allow the SVSM
>> to run and recognize the incoming command.  Ideally, we'd like a
>> solution that doesn't require modifying all the TPM drivers out there
>> (in Linux, Windows, OVMF, grub, ...).
> 
> As best I could tell looking at the public Ubuntu confidential VM
> image published in Azure, there were no modifications to TPM related
> pieces of the stack. So theoretically it appears possible to achieve,
> but I have no idea how they do so at a technical level.
> 
> 
> With regards,
> Daniel
