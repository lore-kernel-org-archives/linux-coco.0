Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0737428469;
	Thu,  5 Feb 2026 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312554; cv=none; b=dqE4uHttPbRVvxEz5YX7IhVc3WDndphSAd2Fw3KAe14bd9ZlbXSBEvhfSEjYyuTPxAqSUKeEoIZXO1VphTTrYYH7LjzE56ZErOorhPPHBXz8sQAbUsIIUJV6xCcGmGFdBuM4q54nbAmHn8qd4swDrZWPVKcpTBLElYxQxDuNgjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312554; c=relaxed/simple;
	bh=0h6aXl3odpNK6UOPrFIUbCWh+xiPmUDlXpbqQDhrshE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBhlk8kGYZ4frfG6f77SEyi62Grv0uAfFGb7ZLLcJ5/YUtRq6FdcdI+AersatkJvypPHBHk/jROtSTUt59cCzp+F2OEknArqe3v3kFMIyRp18CVz89x/z4ifHpICPCiikDixzmyy9jjP8hSfddCu8dAhnkRwcPtEvQb199d9jTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxWACkGJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxWACkGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898D0C19421;
	Thu,  5 Feb 2026 17:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770312554;
	bh=0h6aXl3odpNK6UOPrFIUbCWh+xiPmUDlXpbqQDhrshE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gxWACkGJV7DkZqdSO+Yr0POPlWnhgxybc9tAg6dxFEhlVjQlQtKtTIljdTT0hzq1+
	 h8KjD/VSTs3PLX2jFPkpp7je/j4DVJ107VFASmwRWRQu9HifVKwjMEwB89Ys0I7AXN
	 c4e7RWEYNhNIONgGGL8jGEk5AyQRP93D3O+W7h6musIYXU+WV2OZEHgFg2TUlEH7hU
	 Zv5T98JKbPMN2oOy8HhGH/F4Tc46+No1HTfVOyElgCAKIQP2E2ietHeFJ6qYJT7nvF
	 xt16dahFoksybify+15Y+KDDncnYDnt16EK3DBG4Nz74Q1TpRdXr60fH5nZ4fBsbxd
	 8uR5SZdgstrkw==
Message-ID: <fc60cc71-80eb-4058-8d0a-dbd19a5c10ef@kernel.org>
Date: Thu, 5 Feb 2026 18:29:08 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "Pratik R. Sampat" <prsampat@amd.com>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, ardb@kernel.org, akpm@linux-foundation.org,
 osalvador@suse.de, thomas.lendacky@amd.com, michael.roth@amd.com
References: <20260203174946.1198053-1-prsampat@amd.com>
 <20260203174946.1198053-2-prsampat@amd.com>
 <d07cbb96-ba30-4dcf-ad14-0479d6a989f2@kernel.org>
 <70be936e-e49d-4485-8d1e-416fdf8f40a4@amd.com>
 <aYR0vqwyFPo3EKAi@thinkstation>
 <ce4334f8-5e54-4dbf-9be0-059279ef1962@kernel.org>
 <aYS8O0phOE41IuEF@thinkstation>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <aYS8O0phOE41IuEF@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/26 17:08, Kiryl Shutsemau wrote:
> On Thu, Feb 05, 2026 at 04:48:13PM +0100, David Hildenbrand (Arm) wrote:
>> On 2/5/26 11:48, Kiryl Shutsemau wrote:
>>>
>>> You are calling arch_accept_memory() on every memory allocation if the
>>> memory is not represented in the bitmap. Hard NAK.
>>
>> In which scenarios would we not have memory represented in the bitmap?
>> Guests with <4 GiB? (how does kexec work?) Anything else?
> 
> We create the bitmap that covers all unaccepted memory.

Good! :)

> 
> What memory is unaccepted is up to BIOS. Current implementation of edk2
> accepts the memory in the first 4G range of physical address space. It
> means we won't have bitmap for this range (unaccepted->phys_base >= 4G).

Ah, okay, this comes from the BIOS.

> 
> If the whole VM is smaller than 4G we won't have the bitmap at all.
> 
> We can allocate bitmap for all possible memory. Maybe upto max_possible_pfn?
> But we might not know the value in EFI stub. It costs 4k per 64GiB of
> physical address space.

That's what I would do. 4k per 64GiB sounds reasonable.

> 
> Ideally, we want to know on boot:
> 
>   - what memory ranges are unaccepted - we have it;
>   - what memory range can be removed or added after boot - we don't have it

The SRAT describes memory ranges where we can see hotplug memory. Is 
that too late? We calculate max_possible_pfn based on that.

(don't ask me about special CXL windows and how they are advertised :) )

-- 
Cheers,

David
