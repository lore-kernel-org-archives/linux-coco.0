Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A458283FEF;
	Mon, 12 Jan 2026 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768257795; cv=none; b=RXt/i5WdbET4+HRToHZxZGwdsxA9DFqhXPKEirScPCaQFhLHlg485jBH3A8L7asFH4DydjFLBvCELoOWXSAogTM0OKIMqEXJr2G9+CsJODNPtZC4O6p07QJpBphdNg26hFveXHGvRf4u6bUuo9vQx55XISKY7Iuj0EYdHvHDaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768257795; c=relaxed/simple;
	bh=c8OfXMqmfWAA3Xd0n9k7BRlzt5YJOP+TMrdLjbKQz9w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TnMQgXHE9jQDX01XM8SpcY87LFRmH83+JIxjHT9Vx57wXp6ez4KOF2ZNELThFjjGbyk4r5V4o1XBCJYQ6zDRRCCpBr2vFA+2aOgXILG7nzjIEuV43OH7++1DanE6eM5iwdXZ8EnZ000qeM8jcwV7gyn0Uccg7p9MKBcDReu3nY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XHbI+u/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XHbI+u/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC138C116D0;
	Mon, 12 Jan 2026 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768257795;
	bh=c8OfXMqmfWAA3Xd0n9k7BRlzt5YJOP+TMrdLjbKQz9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XHbI+u/N8z+DTwJcPhNCM4+qG/aYuLLlIhzskPpVct7Tc3RDaA/MIfkN+LEBeGQ9a
	 u7o4OgXc7JM6Gl3fFSKUyXiOBLrsvJA7/55JcfZVY+eI4U31MivvleiDR+w3JZ2Uby
	 V/EuHDE9Q/+3pkXdGRE+/OInHfxbpKW0yms0awY8=
Date: Mon, 12 Jan 2026 14:43:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: linux-mm@kvack.org, linux-coco@lists.linux.dev, x86@kernel.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org, ardb@kernel.org,
 david@kernel.org, osalvador@suse.de, thomas.lendacky@amd.com,
 michael.roth@amd.com
Subject: Re: [PATCH v2 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-Id: <20260112144314.69b850afad9ee67143f30a85@linux-foundation.org>
In-Reply-To: <2f9b180b-c221-4631-93d0-c131332ef178@amd.com>
References: <20260112202300.43546-1-prsampat@amd.com>
	<20260112202300.43546-2-prsampat@amd.com>
	<20260112130401.a857fac6abcf104ea9bb5c68@linux-foundation.org>
	<2f9b180b-c221-4631-93d0-c131332ef178@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Jan 2026 16:23:37 -0600 "Pratik R. Sampat" <prsampat@amd.com> wrote:

> 
> 
> On 1/12/26 3:04 PM, Andrew Morton wrote:
> > On Mon, 12 Jan 2026 14:22:59 -0600 "Pratik R. Sampat" <prsampat@amd.com> wrote:
> > 
> >> Confidential computing guests require memory to be accepted before use.
> >> The unaccepted memory bitmap maintained by firmware does not track
> >> hotplugged memory ranges.
> >>
> >> Call arch_accept_memory() during the hot-add path to explicitly validate
> >> and transition the newly added memory to a private state, making it
> >> usable by the guest.
> >>
> >> Signed-off-by: Pratik R. Sampat <prsampat@amd.com>
> >> ---
> >>  mm/memory_hotplug.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> >> index a63ec679d861..8cfbf0541430 100644
> >> --- a/mm/memory_hotplug.c
> >> +++ b/mm/memory_hotplug.c
> >> @@ -38,6 +38,7 @@
> >>  #include <linux/node.h>
> >>  
> >>  #include <asm/tlbflush.h>
> >> +#include <asm/unaccepted_memory.h>
> > 
> > This only exists for x86!
> 
> Ah, I missed that entirely. Thanks for catching that.
> 
> Probably not the best option to have a generic unaccepted_memory.h as well.
> Maybe, I should have arch_[un]accept_memory() definitions within mm.h wrapped
> within CONFIG_UNACCEPTED_MEMORY instead so that its cleaner.

Something like that.

The idiomatic Linus way is to use

#ifndef arch_accept_memory
#define arch_accept_memory ...
#endif

Lots of prior art here:

	grep -r include/linux "ifndef arch_"


Oh, arch_get_idle_state_flags() got it all wrong.

	#ifdef CONFIG_ACPI_PROCESSOR_IDLE
	#ifndef arch_get_idle_state_flags
	static inline unsigned int arch_get_idle_state_flags(u32 arch_flags)
	{
		return 0;
	}
	#endif
	#endif /* CONFIG_ACPI_PROCESSOR_IDLE */

- shouldn't have needed "ifdef CONFIG_ACPI_PROCESSOR_IDLE"

- should have appended

	#define arch_get_idle_state_flags arch_get_idle_state_flags

  in case cpp hit the same lines a second time.

