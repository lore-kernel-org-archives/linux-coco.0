Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE264184C
	for <linux-coco@lists.linux.dev>; Fri, 15 Dec 2023 19:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v23INxCz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wnOZiLcV"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702669363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vVG4NAqs9+dZcw0p2Y4JWS8E4Fl5VogUKIs4fswV0n0=;
	b=v23INxCzP7f8XjZg1ESoi8+tgmRBXtpGO83HN81UJ4EZRlNmgsOhbu0eGJN0TWm22pkpyS
	vWC/Q8Z838O5BDF3oVul+/tlZqhsQ1iQv1QpNC8YbSz4A62HRTh4M38W5mbMzx/UBZ8NoT
	c1KRX4D0/t0IvDVVE2K8RUCWRqqnLI09F1plpBCfmCJvspVIPpAU7h2pxFYZIdPtt88JKA
	ZAApJAkT+EUx5pAKq4Uk6tLvNQAIvg/G3OnxpkV/VLc63mvFVHKZOOstNP91wSgE0gQWU/
	9jfspKyIjDVB0Jc842EQnnkO+uFXWp204D0pA3DeC2U80yIan5AJWUrMHZOg9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702669363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vVG4NAqs9+dZcw0p2Y4JWS8E4Fl5VogUKIs4fswV0n0=;
	b=wnOZiLcVGhXbSAXYZzTmdnQxbG6KkYq7hY2XWQKN3QNM4tg/pQuNbXqGkjkIKnZK71Lv5o
	daNzynO5B9OqgSCw==
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom
 Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>, "Huang,
 Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
 kexec@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCHv4 03/14] cpu/hotplug: Add support for declaring CPU
 offlining not supported
In-Reply-To: <20231205004510.27164-4-kirill.shutemov@linux.intel.com>
References: <20231205004510.27164-1-kirill.shutemov@linux.intel.com>
 <20231205004510.27164-4-kirill.shutemov@linux.intel.com>
Date: Fri, 15 Dec 2023 20:42:42 +0100
Message-ID: <87il4zmevh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 05 2023 at 03:44, Kirill A. Shutemov wrote:
>  
> +static bool cpu_hotplug_offline_disabled;

__ro_after_init?

Other than that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
