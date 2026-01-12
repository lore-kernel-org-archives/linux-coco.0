Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570C2E6CC5;
	Mon, 12 Jan 2026 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768251843; cv=none; b=acSq3M9SV/5sA9oGaLnwD6ac1U5PafssdrtFrOXbfjs2S/S6P7tFgIsy6ecVQkYrLzKSWXQaQzGCHGsYEpH5CtlAkgoQDzhavq8xSXvr34fAixfXLLcFCU7f5Sj7N/DhvokAn4r3k/lL4nvnEQzPdBIFN7J+tgTEX3NvaStmYUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768251843; c=relaxed/simple;
	bh=Jup1Omb5sLymm05ATlhfAfwm6f0U+ePkTmvf947znfo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=h/zqok9QrCWFeDN8RDfdczJx5JrNwYCAXbmfuz9wm3eOgoJRiwFD5tHajM/Igsv8p3pa+k0nI8Ek9ab7vRmprEe/IucqPBL71iWOqhAnngX3SCG1l3IQgd6+R9C0RE/762ApCUzEG8QSdmvrAdOilaNCzgMY5MhAoBr8GZ0XZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=p7om5414; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="p7om5414"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1CCC116D0;
	Mon, 12 Jan 2026 21:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768251842;
	bh=Jup1Omb5sLymm05ATlhfAfwm6f0U+ePkTmvf947znfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p7om5414d7KdaL8YfBjMVG5a6p9mS8GIWN98LDosbnDyr78i1WKGzlDc8GqMHv17M
	 45rkMYcuq7pytyqE6V06R1SixXfveojDRBcaOcTDYcNbKG4kIvYwhWegn+WlvjcC68
	 3s+dugaiOLRJC/zfBnPBPkbpr9rPo/QfH0Daq5VM=
Date: Mon, 12 Jan 2026 13:04:01 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, <x86@kernel.org>,
 <linux-kernel@vger.kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <kas@kernel.org>,
 <ardb@kernel.org>, <david@kernel.org>, <osalvador@suse.de>,
 <thomas.lendacky@amd.com>, <michael.roth@amd.com>
Subject: Re: [PATCH v2 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
Message-Id: <20260112130401.a857fac6abcf104ea9bb5c68@linux-foundation.org>
In-Reply-To: <20260112202300.43546-2-prsampat@amd.com>
References: <20260112202300.43546-1-prsampat@amd.com>
	<20260112202300.43546-2-prsampat@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Jan 2026 14:22:59 -0600 "Pratik R. Sampat" <prsampat@amd.com> wrote:

> Confidential computing guests require memory to be accepted before use.
> The unaccepted memory bitmap maintained by firmware does not track
> hotplugged memory ranges.
> 
> Call arch_accept_memory() during the hot-add path to explicitly validate
> and transition the newly added memory to a private state, making it
> usable by the guest.
> 
> Signed-off-by: Pratik R. Sampat <prsampat@amd.com>
> ---
>  mm/memory_hotplug.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index a63ec679d861..8cfbf0541430 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -38,6 +38,7 @@
>  #include <linux/node.h>
>  
>  #include <asm/tlbflush.h>
> +#include <asm/unaccepted_memory.h>

This only exists for x86!

Otherwise, the mm/ changes are minimal so I volunteer this patchset
for the x86 tree ;)
