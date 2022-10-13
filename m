Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com [136.143.188.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795D4429
	for <linux-coco@lists.linux.dev>; Thu, 13 Oct 2022 21:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665695694; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bYiu2dN5bcRZRejLM5zPW+tJzVln31Fte1bAW+ojY6pYwqnDy2tf3uQJDS2TNJLIoR12TGo/5/SuLflzJxqfNKX5MM2GhCd1xtLwKnSY2c2/rE/Wd6eIvUkvINhX/BKJd4Fzj8w0RveHI3Hm72MtUd45sjqAF+6ExV+GQuSNeNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665695694; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ahgvkfojadIydy9dQmBzCiPXmhbhTOYv3vQIksuZY5U=; 
	b=RkUr3oB6jXKZAGUapD7IlSK38h1oCOij/g2ULLNWwwrA7sBM0Uahuk5L9QkaS/FYRYe97+jLGnwZ8hNwTEUT9/wIe6WFQFhwZnNHhK/BpRVLf/qz7tonbQNCTo4Z0mzmUDeoJFDA21RjUwLfOooaJsVfDpu6ne0h3TvMW9/KVnM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665695694;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ahgvkfojadIydy9dQmBzCiPXmhbhTOYv3vQIksuZY5U=;
	b=JIZe1wTfrWKuNewTO9PBFN3Kr9KdSVOhhpX8ATLVH4bqFoG8eXKte4DrQBzoLqnE
	th/VljTqW86FdHNtzsWEVuK3cEnijQuXBavA7VGf+Jh0vokwhZ2AjD4uAKtdusGqVDL
	HN4yT/SC+4kPAptwy0X7Qp4pjg2ZT4te+OjLdVm4=
Received: from [192.168.165.135] (mobile-166-171-58-80.mycingular.net [166.171.58.80]) by mx.zohomail.com
	with SMTPS id 1665695692027359.7864875220614; Thu, 13 Oct 2022 14:14:52 -0700 (PDT)
Message-ID: <b51ea7a5-256e-5138-d956-ddacd4148f9c@apertussolutions.com>
Date: Thu, 13 Oct 2022 17:14:47 -0400
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
 <3474b28c-2de2-db95-9ecf-6b7c1a59d860@apertussolutions.com>
 <a77148556d530d6b6983d8fb1c6d8bdaf81cb695.camel@linux.ibm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a77148556d530d6b6983d8fb1c6d8bdaf81cb695.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/13/22 17:06, James Bottomley wrote:
> On Thu, 2022-10-13 at 16:54 -0400, Daniel P. Smith wrote:
>> Pardon the interjection.
>>
>> On 10/13/22 15:20, James Bottomley wrote:
>>> On Thu, 2022-10-13 at 13:54 -0500, Tom Lendacky wrote:
>>>> On 10/12/22 14:05, James Bottomley wrote:
>>>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert
>>>>> wrote:
>>>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
>>>> ...
>>>>> It is theoretically possible to emulate a CRB TPM with just a
>>>>> single
>>>>> communication page and an ACPI entry (the Linux CRB driver is
>>>>> ACPI
>>>>> only
>>>>> at this time and responds to the "MSFT0101" ACPI entry).
>>>>>
>>>>> The CRB device responds to a very compact MMIO region (0x30
>>>>> bytes
>>>>> long)
>>>>> described in the CRB spec:
>>>>>
>>>>> https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/
>>
>> IMHO I would not use the mobile CRB, which was designed as a
>> doorbell solution for ARM where trapping a page was not possible.
>> Since it is possible to trap on page access, this makes it possible
>> to implement the PC Client MMIO interface and enables implementations
>> to provide the complete set of TPM capabilities, e.g. localities.
> 
> You mean the TIS interface:
> 
> https://trustedcomputinggroup.org/resource/pc-client-work-group-pc-client-specific-tpm-interface-specification-tis/
> 
> We discussed this at length with AMD ... which I think isn't captured
> in the email archives, unfortunately.  However, the bottom line is that
> TIS uses a FIFO approach to sending data through the MMIO page.  That's
> simply unscalable for pure emulation because it will result in 10-100x
> the number of write traps in the MMIO page as the CRB driver which uses
> a MMIO mailbox to trigger actions but passes the data via physical page
> addresses not FIFOs.

Yes I am referring to the TIS interface but FIFO is only one of the 
software interface defined in the spec. There is also the TIS CRB 
interface which I should enable a similar experience as the mobile CRB.

> So I think we could implement a reasonably performant CRB driver using
> page trapping emulation, but not a TIS one.  For an enlightened driver,
> a simple call interface seems to suffice.
> 
> James
> 
> 
