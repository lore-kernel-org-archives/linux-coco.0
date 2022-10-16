Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com [136.143.188.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A1523BE
	for <linux-coco@lists.linux.dev>; Sun, 16 Oct 2022 16:29:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665937759; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ehyhoo0lV2yUZvqZA7N/1LzeY4MpQFeZ0HQpQJjz3NaA2FGlqYCG6Q9RWupzYQSx0vSg/mnjRLcXNm/qBzsa61+vYKxWZJ/ekUqjelaO0Df9RVCRTB6rDDqpAKpAwkpFzNUDK4vNDu0xy1ZNXh2L5+PBVRGNwxdnUN0TetBDxx4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665937759; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ILrUEwP72V2FdMhVdChDcmA2bHOfGN+KD69Zu5CUN98=; 
	b=laUJ3uOGdccxPcGkXjgS0rRSE/LBg36ShGtvLiVEt4suldXXK5XJguH//IgysL99I+2lcXjgESsTUH2hCjWhY9nUT8fywypkXcG5vSJ5IzkjkESQYYX+ecpG2xrTgZaj6jznN8g2922RX3whcADr+cDGXcL/zcmVCwD+u8Jt1F4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665937759;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ILrUEwP72V2FdMhVdChDcmA2bHOfGN+KD69Zu5CUN98=;
	b=vKV6qTQwsJRuJUEMVCV5qsds1ouME1uLWhpwC1o8r9pzH9Zl6muSi0x5FPxCnLx/
	1iTvQSEqea0+MMmuc2UWoIMYNMX4gzFtHkjiQaGvEbwZoMLiqFXv23LHG5Y/Vl3B+85
	BwGHA+AEQRfCaI/G7FtuS+YKT/159vMtZyBny/oE=
Received: from [192.168.1.140] (172.58.180.140 [172.58.180.140]) by mx.zohomail.com
	with SMTPS id 1665937758152783.4798466447578; Sun, 16 Oct 2022 09:29:18 -0700 (PDT)
Message-ID: <485fd3eb-5547-6688-cb6f-007c0c08af2c@apertussolutions.com>
Date: Sun, 16 Oct 2022 12:29:14 -0400
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
To: Tom Lendacky <thomas.lendacky@amd.com>,
 Stuart Yoder <stuart.yoder@arm.com>, jejb@linux.ibm.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
 <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
 <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
 <3474b28c-2de2-db95-9ecf-6b7c1a59d860@apertussolutions.com>
 <a77148556d530d6b6983d8fb1c6d8bdaf81cb695.camel@linux.ibm.com>
 <b51ea7a5-256e-5138-d956-ddacd4148f9c@apertussolutions.com>
 <ce89a3298963f4fa234e46ae9fe00da66e2ff819.camel@linux.ibm.com>
 <0a0f3b57-13c6-8161-8674-1dbcf3ca9ddc@arm.com>
 <a08770c2-c925-3f1a-cdb0-dc4bab5e42fe@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a08770c2-c925-3f1a-cdb0-dc4bab5e42fe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/14/22 17:46, Tom Lendacky wrote:
> On 10/14/22 12:16, Stuart Yoder wrote:
>> On 10/13/22 4:41 PM, James Bottomley wrote:
>>> On Thu, 2022-10-13 at 17:14 -0400, Daniel P. Smith wrote:
>>>> On 10/13/22 17:06, James Bottomley wrote:
>>>>> On Thu, 2022-10-13 at 16:54 -0400, Daniel P. Smith wrote:
>>>>>> Pardon the interjection.
>>>>>>
>>>>>> On 10/13/22 15:20, James Bottomley wrote:
>>>>>>> On Thu, 2022-10-13 at 13:54 -0500, Tom Lendacky wrote:
>>>>>>>> On 10/12/22 14:05, James Bottomley wrote:
>>>>>>>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert
>>>>>>>>> wrote:
>>>>>>>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
>>>>>>>> ...
>>>>>>>>> It is theoretically possible to emulate a CRB TPM with just
>>>>>>>>> a
>>>>>>>>> single
>>>>>>>>> communication page and an ACPI entry (the Linux CRB driver
>>>>>>>>> is
>>>>>>>>> ACPI
>>>>>>>>> only
>>>>>>>>> at this time and responds to the "MSFT0101" ACPI entry).
>>>>>>>>>
>>>>>>>>> The CRB device responds to a very compact MMIO region (0x30
>>>>>>>>> bytes
>>>>>>>>> long)
>>>>>>>>> described in the CRB spec:
>>>>>>>>>
>>>>>>>>> https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/
>>>>>>>>>
>>>>>>
>>>>>> IMHO I would not use the mobile CRB, which was designed as a
>>>>>> doorbell solution for ARM where trapping a page was not possible.
>>>>>> Since it is possible to trap on page access, this makes it
>>>>>> possible
>>>>>> to implement the PC Client MMIO interface and enables
>>>>>> implementations
>>>>>> to provide the complete set of TPM capabilities, e.g. localities.
>>>>>
>>>>> You mean the TIS interface:
>>>>>
>>>>> https://trustedcomputinggroup.org/resource/pc-client-work-group-pc-client-specific-tpm-interface-specification-tis/
>>>>>
>>>>>
>>>>> We discussed this at length with AMD ... which I think isn't
>>>>> captured in the email archives, unfortunately.  However, the bottom
>>>>> line is that TIS uses a FIFO approach to sending data through the
>>>>> MMIO page.  That's simply unscalable for pure emulation because it
>>>>> will result in 10-100x the number of write traps in the MMIO page
>>>>> as the CRB driver which uses a MMIO mailbox to trigger actions but
>>>>> passes the data via physical page addresses not FIFOs.
>>>>
>>>> Yes I am referring to the TIS interface but FIFO is only one of the
>>>> software interface defined in the spec. There is also the TIS CRB
>>>> interface which I should enable a similar experience as the mobile
>>>> CRB.
>>>
>>> Well, not in the above spec there isn't, it's a pure FIFO.  I think you
>>> might be thinking of the PTP spec:
>>>
>>> https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
>>>
>>>
>>> which defined locality mapping for the CRB interface (among other
>>> things).  But regardless of the TCG maze of slightly overlapping specs,
>>> I think you now agree we can't use the FIFO interface because of the
>>> high access trap overhead.  The outstanding question is over
>>> localities, but simply implementing the PTP multiple pages won't give
>>> us that.  It works for physical hardware because there's an motherboard
>>> implementation specific way of shutting off access to MMIO registers at
>>> a given locality.  We'd have to define such a thing for the SVSM ...
>>> but, as of today, it's not really properly defined for OVMF, indicating
>>> no-one's really using it as a security property for virtual
>>> environments.
>>
>> Unless you expect to have some kind of virtual DRTM, all you need is
>> locality 0 in a virtual environment.
>>
>> You could invent a new CRB-like interface, but how will it be 
>> advertised? Through a new ACPI table definition that has to
>> get accepted by the UEFI Forum?  Updating the TCG ACPI spec?
>> And you will obviously need new drivers for each OS to be supported.
> 
> Since we're talking about enlightened guests, we can query the SVSM 
> (through the SVSM_CORE_QUERY_PROTOCOL API) to check for the availability 
> of the vTPM protocol. If present, then the OS will know to load an SVSM 
> vTPM driver. This could be done, for example, on Linux, by registering a 
> platform device.
> 
> Thanks,
> Tom

If enlightened guest/driver is acceptable, then why not adopt the 
pv-vTPM protocol, Xen's vTPM driver, for which there is already a driver 
present in the kernel, was designed for deep attestation, and does not 
inhibit/block features such as locality?

v/r,
dps

>>
>> If you want to use a standard CRB and avoid overhead due to polling
>> in an MMIO interface you can implement the CRB interface completely in
>> normal DRAM, which is what is done for Trustzone-based firmware TPMs
>> on Arm.  The Mobile CRB spec specifically allows this. But, you will 
>> need a doorbell mechanism to signal the TPM to "start" operating on
>> a command that has been put in the CRB in DRAM.  The Linux CRB driver
>> works out of the box with this approach.
>>
>> The standard TPM2 ACPI table could be used and all you need to define
>> is a new start method.
>>
>> There are tradeoffs for both approaches.
>>
>> Thanks,
>> Stuart
>>
