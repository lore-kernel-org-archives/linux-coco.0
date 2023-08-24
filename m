Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7443515AD3
	for <linux-coco@lists.linux.dev>; Thu, 24 Aug 2023 19:31:43 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1692905501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n8yDla5pLPlOBoH9R5UIcl3zdGCQ45eLIUaoUZiqZRg=;
	b=ejX/5GLtjhWI5JeO1TOp5d81z6CBY7R1PnpW7jcjwnR38L2IWffvKTfybh4kHhlsIQfSMr
	FTHxlG1pKcqZc4tPisqaN1Gg0yDXlUMCS9Ami3l9iWFSYmSKTNABt6n7uzpUOOOq72WesW
	92OZ+qRM04nVUPu/ocGZdxkK9sJ5gxXl1n07ACwK7pZokxBw2ATffuBdFkDMakyaoziYhC
	s+MjyyQ8lWRacuIuy58aYKpapQUP0owAPi4o91kFLOeSFZM9K5EHgA2vI/0q125Zw5X1GS
	N5OevJcxtgueqJHelTkkG+wRYkNo79P2CVz0bUG0LAyM6mcRztVf33bXofA7xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1692905501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n8yDla5pLPlOBoH9R5UIcl3zdGCQ45eLIUaoUZiqZRg=;
	b=Uisgrkt/WrXB8xZZz2J41MLgpatWcrSm2tVY5eG8pt8YpjaLyLBnQACE7TBiS0AeUqfoAP
	jfK9dcm1Kxn1b7Bg==
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen
 <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima
 <jun.nakajima@intel.com>, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
In-Reply-To: <20230808200111.nz74tmschph435ri@box>
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com>
 <20230808200111.nz74tmschph435ri@box>
Date: Thu, 24 Aug 2023 21:31:39 +0200
Message-ID: <878ra0ck4k.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Aug 08 2023 at 23:01, Kirill A. Shutemov wrote:
> On Tue, Aug 08, 2023 at 10:13:05AM -0700, Dave Hansen wrote:
>> On 8/8/23 09:23, Kirill A. Shutemov wrote:
>> ...
>> > On the other hand, other clock sources (such as HPET, ACPI timer,
>> > APIC, etc.) necessitate VM exits to implement, resulting in more 
>> > fluctuating measurements compared to TSC. Thus, those clock sources
>> > are not effective for calibrating TSC.
>> 
>> Do we need to do anything to _those_ to mark them as slightly stinky?
>
> I don't know what the rules here. As far as I can see, all other clock
> sources relevant for TDX guest have lower rating. I guess we are fine?

Ideally they are not enumerated in the first place, which prevents the
kernel from trying.

> There's notable exception to the rating order is kvmclock which is higher
> than tsc.

Which is silly aside of TDX.

> It has to be disabled, but it is not clear to me how. This topic
> is related to how we are going to filter allowed devices/drivers, so I
> would postpone the decision until we settle on wider filtering schema.

TDX aside it might be useful to have a mechanism to select TSC over KVM
clock in general.

Thanks,

        tglx
