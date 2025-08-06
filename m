Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF928C2B9
	for <linux-coco@lists.linux.dev>; Wed,  6 Aug 2025 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493556; cv=none; b=rGFgCPAkPtsDbOu7k93AXY0VxqHHemQxe8pZy3puPVqv1N8AQJKuvECcmrsCDAY0kpgCW9e5YiCpiUmw0LrsYOV7NaF4eEGFw5kbfxNPddod4nVxWv7nvfqr62P4LQOHdVwLw+glyfWqlOO/gdxkoQWRh57t9KVVo7uDDLrnQCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493556; c=relaxed/simple;
	bh=+SzIyp+azHzXi3wmerkgl+OB8gD77zXbcUhm1m4L1GI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U+dHEEmlyPNf1wa0+XxJ6cksqfL30c5YlWU1MtAKlS+apzDFCwF2aQK5NBfZkv/mPw/FYFs8MfjXCugfF5YbRd+8uKeFNA0lPAjTxftsuWHUryxLyauyqbDgcmlFJDFmwtsbciL0HmuJ3ex88W3/gWfyK5zhNz2Mz1bE0GYy39k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fshTcMnx; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fshTcMnx"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31f3b65ce07so76211a91.1
        for <linux-coco@lists.linux.dev>; Wed, 06 Aug 2025 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754493554; x=1755098354; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDQStjMluPm00O/x8xuIBu0JMlXP4PdE4vThsGuTUgQ=;
        b=fshTcMnxfMBSonSkdf+wdwZPqvEjKD1sn6iDzv5EifgltohHMcwogJjKgaeof9xRlw
         tSzT1YRGAOWs3KJMgCD8IKq93sy4dcW4o+Qyh5aAcq1R+pJ4qB3CtqBDY+BnWs+G4u93
         0kX3S++uKgJfCtPacJhK2NOgyKfMlaHbXba2d4aMV4CY9oMLv1JirhEQK59nsE4FfOqw
         /644ORtxntAYsvT9ie9EcTEU06QEJV9feWI/c1XOXx8FQxkZKTkjB0vPPuLEeJbbfupf
         POWdhej+1BkFG9NziUgNc2CMl94ojAmHHPxtqzRZzExnGO0TK/lieJbaZ3iHI2e3v98k
         b+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493554; x=1755098354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KDQStjMluPm00O/x8xuIBu0JMlXP4PdE4vThsGuTUgQ=;
        b=WshvgsPrOGmG/iTz7mNejR+ic91IHKsfN9axX7TQZ1UnxAfxkv5mRc/YEoz7kn4iSX
         H85xwFfKemfu+nz2cWa+6K04Z/65MmIZpSMP7dIQGLO4BPKU2diGhERRXXE/nkeLvdSH
         TDUxvxPCpazVazBQN/Uukgxwwsj7KNYynUX1UM+nVXO06QyHVHjKiATsGcIKmZN61tnw
         sGf2lSDBhes2iHBRMcXAJfxuuFjeNngye7yEOcpg5WgZadpDSSd6oWH7FP5jdKiAswc6
         iyJplEaN/lapEK+amw8V+CGUUnNtfIOpYW2jdOhMmPUn7AyHZVdQ1j594uue+lTssdxq
         3uEw==
X-Forwarded-Encrypted: i=1; AJvYcCWQqbmlBUVBkWkiOS0q4B2ML/CgUhuYg9FG7Dt45S0IaFKOYxCts7POdsxZz2MI5DBkpxkO8EE68nIJ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm6ANdLDAwxGYSidjqThDfmcEO05rzAx4VGucDeMATxHc+jYE4
	5Z7I3dfpkB57fKRF/zxYeGffETkPETV8HzIDCZniM6mOzFha+U3DaWEDUPrHfc0Zc4NrCS5OOGp
	L6fgPEg==
X-Google-Smtp-Source: AGHT+IE0ws3A1oPMpeyK+BWoSra1biTwg8ZIx15Eh9OYdEDbAXwg9YusjzqGIk7Bj9JXcN/gIQTc0EhEi2I=
X-Received: from pjx15.prod.google.com ([2002:a17:90b:568f:b0:31c:32f8:3f88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d607:b0:31e:ebb6:6499
 with SMTP id 98e67ed59e1d1-32166cc68fdmr4543810a91.24.1754493554269; Wed, 06
 Aug 2025 08:19:14 -0700 (PDT)
Date: Wed, 6 Aug 2025 08:19:13 -0700
In-Reply-To: <7f1aaf559a4f93f63f8e996938cfd957e151cb50.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aFxpuRLYA2L6Qfsi@google.com> <vgk3ql5kcpmpsoxfw25hjcw4knyugszdaeqnzur6xl4qll73xy@xi7ttxlxot2r>
 <3e55fd58-1d1c-437a-9e0a-72ac92facbb5@intel.com> <aF1sjdV2UDEbAK2h@google.com>
 <1fbdfffa-ac43-419c-8d96-c5bb1bdac73f@intel.com> <70484aa1b553ca250d893f80b2687b5d915e5309.camel@intel.com>
 <aIv8wZzs1oXDCXSU@google.com> <3f39e6f85341e141f61527b3192cefde0097edb8.camel@intel.com>
 <aIwB6X6cw9kwgJzs@google.com> <7f1aaf559a4f93f63f8e996938cfd957e151cb50.camel@intel.com>
Message-ID: <aJNycTvk1GEWgK_Q@google.com>
Subject: Re: [PATCHv2 01/12] x86/tdx: Consolidate TDX error handling
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Chao Gao <chao.gao@intel.com>, Dave Hansen <dave.hansen@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	Kai Huang <kai.huang@intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 01, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-07-31 at 16:53 -0700, Sean Christopherson wrote:
> > On Thu, Jul 31, 2025, Rick P Edgecombe wrote:
> > > On Thu, 2025-07-31 at 16:31 -0700, Sean Christopherson wrote:
> > > > On Wed, Jul 30, 2025, Rick P Edgecombe wrote:
> > > > > So STATUS_OPERAND_BUSY() seems like an ok thing to try next for v3 of this
> > > > > series at least. Unless anyone has any strong objections ahead of time.
> > > > 
> > > > Can you make it IS_TDX_STATUS_OPERAND_BUSY() so that it's obviously a check and
> > > > not a statement/value, and to scope it to TDX?
> > > 
> > > It's a mouthful, but I can live with it. Yea, it def should have TDX in the name.
> > 
> > IS_TDX_STATUS_OP_BUSY?
> 
> Ehh, would nicer to have it closer to what is in the TDX docs. The worst
> would be to read TDX_STATUS_OP_BUSY, then have to look at the value to figure
> out which error code it actually was.
> 
> Maybe just drop STATUS and have IS_TDX_OPERAND_BUSY()? It still loses the ERR
> part, which made it look like IS_ERR().

Any of the IS_TDX_xxx options work for me.
