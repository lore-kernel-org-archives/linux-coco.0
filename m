Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6444D3C13
	for <linux-coco@lists.linux.dev>; Fri, 14 Oct 2022 17:17:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1B0E1042;
	Fri, 14 Oct 2022 10:17:14 -0700 (PDT)
Received: from [192.168.10.105] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61CEA3F766;
	Fri, 14 Oct 2022 10:17:08 -0700 (PDT)
Message-ID: <0a0f3b57-13c6-8161-8674-1dbcf3ca9ddc@arm.com>
Date: Fri, 14 Oct 2022 12:16:58 -0500
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: jejb@linux.ibm.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
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
From: Stuart Yoder <stuart.yoder@arm.com>
In-Reply-To: <ce89a3298963f4fa234e46ae9fe00da66e2ff819.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/22 4:41 PM, James Bottomley wrote:
> On Thu, 2022-10-13 at 17:14 -0400, Daniel P. Smith wrote:
>> On 10/13/22 17:06, James Bottomley wrote:
>>> On Thu, 2022-10-13 at 16:54 -0400, Daniel P. Smith wrote:
>>>> Pardon the interjection.
>>>>
>>>> On 10/13/22 15:20, James Bottomley wrote:
>>>>> On Thu, 2022-10-13 at 13:54 -0500, Tom Lendacky wrote:
>>>>>> On 10/12/22 14:05, James Bottomley wrote:
>>>>>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert
>>>>>>> wrote:
>>>>>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
>>>>>> ...
>>>>>>> It is theoretically possible to emulate a CRB TPM with just
>>>>>>> a
>>>>>>> single
>>>>>>> communication page and an ACPI entry (the Linux CRB driver
>>>>>>> is
>>>>>>> ACPI
>>>>>>> only
>>>>>>> at this time and responds to the "MSFT0101" ACPI entry).
>>>>>>>
>>>>>>> The CRB device responds to a very compact MMIO region (0x30
>>>>>>> bytes
>>>>>>> long)
>>>>>>> described in the CRB spec:
>>>>>>>
>>>>>>> https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/
>>>>
>>>> IMHO I would not use the mobile CRB, which was designed as a
>>>> doorbell solution for ARM where trapping a page was not possible.
>>>> Since it is possible to trap on page access, this makes it
>>>> possible
>>>> to implement the PC Client MMIO interface and enables
>>>> implementations
>>>> to provide the complete set of TPM capabilities, e.g. localities.
>>>
>>> You mean the TIS interface:
>>>
>>> https://trustedcomputinggroup.org/resource/pc-client-work-group-pc-client-specific-tpm-interface-specification-tis/
>>>
>>> We discussed this at length with AMD ... which I think isn't
>>> captured in the email archives, unfortunately.  However, the bottom
>>> line is that TIS uses a FIFO approach to sending data through the
>>> MMIO page.  That's simply unscalable for pure emulation because it
>>> will result in 10-100x the number of write traps in the MMIO page
>>> as the CRB driver which uses a MMIO mailbox to trigger actions but
>>> passes the data via physical page addresses not FIFOs.
>>
>> Yes I am referring to the TIS interface but FIFO is only one of the
>> software interface defined in the spec. There is also the TIS CRB
>> interface which I should enable a similar experience as the mobile
>> CRB.
> 
> Well, not in the above spec there isn't, it's a pure FIFO.  I think you
> might be thinking of the PTP spec:
> 
> https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
> 
> which defined locality mapping for the CRB interface (among other
> things).  But regardless of the TCG maze of slightly overlapping specs,
> I think you now agree we can't use the FIFO interface because of the
> high access trap overhead.  The outstanding question is over
> localities, but simply implementing the PTP multiple pages won't give
> us that.  It works for physical hardware because there's an motherboard
> implementation specific way of shutting off access to MMIO registers at
> a given locality.  We'd have to define such a thing for the SVSM ...
> but, as of today, it's not really properly defined for OVMF, indicating
> no-one's really using it as a security property for virtual
> environments.

Unless you expect to have some kind of virtual DRTM, all you need is
locality 0 in a virtual environment.

You could invent a new CRB-like interface, but how will it be 
advertised?  Through a new ACPI table definition that has to
get accepted by the UEFI Forum?  Updating the TCG ACPI spec?
And you will obviously need new drivers for each OS to be supported.

If you want to use a standard CRB and avoid overhead due to polling
in an MMIO interface you can implement the CRB interface completely in
normal DRAM, which is what is done for Trustzone-based firmware TPMs
on Arm.  The Mobile CRB spec specifically allows this. But, you will 
need a doorbell mechanism to signal the TPM to "start" operating on
a command that has been put in the CRB in DRAM.  The Linux CRB driver
works out of the box with this approach.

The standard TPM2 ACPI table could be used and all you need to define
is a new start method.

There are tradeoffs for both approaches.

Thanks,
Stuart
