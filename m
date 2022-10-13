Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com [136.143.188.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC88C4429
	for <linux-coco@lists.linux.dev>; Thu, 13 Oct 2022 20:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665694454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DAHZdBA0Kdop2VlXBm3Xo5DhJtqpHLwv43Qxv38f6vdqBVudNptPwcvwdxzXX0itgSxGG43mwZwK8U6NWN0eWFZjR0iUGvx+rTn5UEkaH/H9wB+s/b24y1ULGg9yA7ZNAP9vGWM76FZhqibqChUvCMD0AyOoe9ktRoxlE/cIL2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665694454; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=oj7F1/FyinQ2Z6P3c+98gOI9jW2RKbKf+jP/zifHWmQ=; 
	b=F7G93+R8wMjKzhQUkwMLhxTOHMxYmVCiadyt8iVdwIRwB2UdIm0plxTzGHFmpwCHlztSUIKRlXvmqwt5S/NG/Mc8eql/JIY3jnXpYBG0E2lz9gq0HMGrYxmkVvo/xRztb9bDJdvWnVW98ThE5VjSE+7mt5uZJM/fnTyj/dID8ws=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665694454;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oj7F1/FyinQ2Z6P3c+98gOI9jW2RKbKf+jP/zifHWmQ=;
	b=h4Uo7Z1AluG2f1d1XKc5d9DPo4R0Sv/RUGzEw3I5IMqLc7CvMCoYA1t9yzeKzKm4
	wRYJE1aAroPSBsVvALBFE+kr+sbNSv/ID9nzJVRK0LxEWE7+aSFAk9u/rf4G2GedIUN
	+NTige/R6G7WzMDO23DmDGW4h6R1QyUZ3ELR+R3M=
Received: from [192.168.165.135] (mobile-166-171-58-80.mycingular.net [166.171.58.80]) by mx.zohomail.com
	with SMTPS id 1665694451979669.514696194052; Thu, 13 Oct 2022 13:54:11 -0700 (PDT)
Message-ID: <3474b28c-2de2-db95-9ecf-6b7c1a59d860@apertussolutions.com>
Date: Thu, 13 Oct 2022 16:54:05 -0400
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: jejb@linux.ibm.com, Tom Lendacky <thomas.lendacky@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Stuart Yoder <stuart.yoder@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
 <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
 <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Pardon the interjection.

On 10/13/22 15:20, James Bottomley wrote:
> On Thu, 2022-10-13 at 13:54 -0500, Tom Lendacky wrote:
>> On 10/12/22 14:05, James Bottomley wrote:
>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
>> ...
>>> It is theoretically possible to emulate a CRB TPM with just a
>>> single
>>> communication page and an ACPI entry (the Linux CRB driver is ACPI
>>> only
>>> at this time and responds to the "MSFT0101" ACPI entry).
>>>
>>> The CRB device responds to a very compact MMIO region (0x30 bytes
>>> long)
>>> described in the CRB spec:
>>>
>>> https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/

IMHO I would not use the mobile CRB, which was designed as a doorbell 
solution for ARM where trapping a page was not possible. Since it is 
possible to trap on page access, this makes it possible to implement the 
PC Client MMIO interface and enables implementations to provide the 
complete set of TPM capabilities, e.g. localities.

>>> In theory we could use a page that keeps trapping to the SVSM for
>>> this,
>>> but the problem is that the CRB driver polls a register in the MMIO
>>> region to check command completion, so even a single TPM command is
>>> going to generate a huge number of such traps.  So while it's
>>> theoretically possible to generate a SVSM emulation of the CRB
>>> device,
>>> it would likely be too expensive in terms of traps, particularly if
>>> we're using the SVSM vTPM for runtime measurements like IMA.
>>>
>>> If we're going to do a new driver, I think basing it off the CRB
>>> spec
>>> would be fine (the spec envisages command request/response being
>>> via
>>> areas outside the MMIO region) and we could simply do a new driver
>>> that
>>> plumbs directly into the nine operations in the tpm_class_ops
>>> structure
>>>
>>
>> This sounds good. I think we can model an API call to the SVSM vTPM
>> using
>> this. We can provide a struct that looks similar to the CRB Control
>> Area
>> and supply the GPA of this struct in RCX to the SVSM for the vTPM to
>> perform the operation:
>>
>>       - Command GPA
>>       - Command Size
>>       - Response GPA
>>       - Response Size
>>       - Status
> 
> Realistically, I think all TPM2 command/response actions can be packed
> into
> 
> u32 TPM2_action(u64 command_gpa, u32 command_len, u64 response_gpa, u32
> *response_len)
> 
> Where the u32 return would be the status (although if the SVSM has
> trouble with the return status, we could add it as an extra modified
> variable).
> 
> The way the current TPM driver interface works is shown in the
> tpm_class_ops structure:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/tpm.h
> 
> we can shim all the non-ignorable calls into the above.  The standard
> way of sending a command is tpm_try_transmit in
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/tpm/tpm-interface.c
> 
> I think we can emulate an interrupt driven tpm (set TPM_CHIP_FLAG_IRQ
> in the driver) and it will simply do a ->send() ->receive() pair, which
> works for us since the thread of execution in ->send() will pass into
> the SVSM and return with the result which we can then copy over in
> ->recv
> 
> Also note that tpm_try_transmit() uses the same buffer for send and
> receive, so it is possible to reduce the number of parameters in
> TPM2_action() above if that's the route people want to go.
> 
>> Anything else that would go in the struct? Locality?
> 
> Well, this is a question.  CRB devices are actually allowed not to have
> a locality at all, so ignoring it is perfectly legal.  On the other
> hand, locality is used to allow or deny certain accesses.
> Traditionally you allow firmware access at locality 4 as the trusted
> hardware component.  However, the problem with implementing localities
> is how does the SVSM know where we're calling from?  If it's unable to
> bar access at certain localities, there's not much point implementing
> them.  For reference the TIS TPM implements separate memory maps of its
> registers, one for each locality and firmware bars access to the OS by
> unmapping a range and refusing to allow the OS to map it back.

If a guest were to attempt the SKINIT instruction, it should result in a 
NAE VMEXIT with reason being SKINIT. I haven't looked in-depth at VMPLs 
in detail yet but I would like to believe this would provide the 
necessary context of who made the call.

This is of particular interest to the TrenchBoot community as we have 
long had on our roadmap the desire to provide vDRTM for guests that is 
coupled with vTPM instances to provide for nested/deep attestation.

> I suspect we'd get on faster by being pejorative and saying we won't
> implement locality since we can't police it.
> 
> James

V/r,
Daniel
