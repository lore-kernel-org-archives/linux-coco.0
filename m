Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162833B47D0
	for <linux-coco@lists.linux.dev>; Tue,  7 Apr 2026 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568026; cv=none; b=VpL3RgG9F68QSveT5guJsVHZbU8y2OF+PTAokw/U01ZrHgtI285V+yshSKZDzDwyxbUzxFHJt9tStgVqNPr2Qhb3HrzDboWa0b18nMplJ1wiCP/aMuJ9KQJXDtJK66q5Bu3BsgT4w0e4AKzk+ARMZPW4SDgmEd+Fub8eddFETJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568026; c=relaxed/simple;
	bh=87CyfNDwFF/L5cnHCUC0dfv1t/cS4nWw6mZ5x+xXPiM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BCk9RZzsfaVUalP2dNmI4I8zuYiWrWTfE6lULiY3lP7k0HEzF8G36zuQ0ImQzA4F9FtvlRTVtwgZkWQCqcl1TmM2/+Fm4FtT+1iYBbXD1kblwjyg0ICVZVHXInqJLkakQ1VA0r7wy450blZG0u73B+6lq+DGzDkz09ScMYHWhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IhqcujDk; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IhqcujDk"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c7423ba5342so7677738a12.0
        for <linux-coco@lists.linux.dev>; Tue, 07 Apr 2026 06:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775568024; x=1776172824; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0bPS983cAWq0du21wO/6yMH6IgpBLm9JLdEvcLcXdGw=;
        b=IhqcujDkMRdus6saLJMJj8F2l7XTHuCzk3pNbAtDucE1I/MmF2cVgQquNhEaIwPcUl
         c8aSI+OwDZYUSvSHArBz2EtJ4GDq3ui23h8Enkrnnry7c6M/Q2ZNpLOS72KAznBlZEQc
         Td7LY+m8vLc16i58GUkyRM0yCJLOnUYsA2yFUOlWm+WbXEkYOHuKbmU286+325iX2fRV
         39UDanhTR9qGL0LL1icIJgKuqOYt3glHwJWitx25T4Ny7417HItrIaok/CPfLHtziqC7
         JyjigyFp6qx40kS39kLn8dBNaPehtTnnaLbvfjQKtoIq2Xxr4OgvfioOKQBj31jD8DI+
         4rWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568024; x=1776172824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bPS983cAWq0du21wO/6yMH6IgpBLm9JLdEvcLcXdGw=;
        b=nbspfK19h+b+pjAlAmRF2HifYixrv0eodiyPEQUbrcdAAQFTbng3T/6qG6p8L22yVg
         4v+0Lgd8fIctleE9t4EoeLM8J1WjAtTkJCeFmoQndw+0oJXKSsgQWuK+Pi8xKtCbbOp3
         5YwfEkfEn0No0o4dSEtqPl0vaFAZVSe48TAFn0CwqNrgbS8nvDpjm3iXdGMYEXLI53W0
         lsjaFOfyZuHxxsS8ZpAZd05KJ6RVgpZ+YRW7vZaEQdroj7UqdOM0cpha4IKKrchhjtFH
         DMp2HNdcrlkRYUlAaQtV7fQhN495Cmx+CLbzrVbE2qdU9hn6/JdoZcCD2gNAEjdF5MPL
         qQOg==
X-Forwarded-Encrypted: i=1; AJvYcCVETsag5yphQV75PqPc2IrKnpia7U7hdxc/yXl5S7JicuZMDm0k1H+M3OuLA2Qkre4SEw+2B51CP0lJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzrE1ecnOSE0xVe8FhJBojNGcJytPkf5/wErW4bN8cn5h3kk9B1
	735xWhr7kFNAk4ycoZ2n5EDiAt5DGCMsdQCdBbIH0CtDercUBMxisQ7MQdTEuJ9krkiUWz4olCq
	eZg42fA==
X-Received: from pfbly4.prod.google.com ([2002:a05:6a00:7584:b0:829:80c3:3c94])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac0c:b0:82c:dc17:2918
 with SMTP id d2e1a72fcca58-82d0da82ec4mr16087412b3a.13.1775568024017; Tue, 07
 Apr 2026 06:20:24 -0700 (PDT)
Date: Tue, 7 Apr 2026 06:20:21 -0700
In-Reply-To: <CABgObfaFqrSENS=_eNgkyxebqL1vFauNqG3XAgZm0EHfkbQ_gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <7ec084f8-812e-42f2-8470-e416fa7ee848@redhat.com>
 <ac75iuf9gHIhvm9u@google.com> <88e9d7f0-35b8-4559-9f4d-c7daf1af6012@redhat.com>
 <aea176c8-35de-4042-bf98-e42ce05f93fb@intel.com> <CABgObfY05NU8DS82jkwpF89_p1nR7VJ30HBq_xaMg_u+-j=0Cw@mail.gmail.com>
 <adPRA4ZhnvbaXSn0@google.com> <CABgObfbLm3FR4f_nv5EyYJx4jwfeBaVgTLhr7P++hmhCP98e3Q@mail.gmail.com>
 <adQs4LQgy3mS2t89@google.com> <CABgObfaFqrSENS=_eNgkyxebqL1vFauNqG3XAgZm0EHfkbQ_gw@mail.gmail.com>
Message-ID: <adUElWItuaghWj89@google.com>
Subject: Re: [PATCH 0/7] KVM: x86: APX reg prep work
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, Kiryl Shutsemau <kas@kernel.org>, kvm <kvm@vger.kernel.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, linux-coco@lists.linux.dev, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 07, 2026, Paolo Bonzini wrote:
> Il mar 7 apr 2026, 00:00 Sean Christopherson <seanjc@google.com> ha scritto:
> >
> > > > .  So unless I'm missing something (or hardware is flawed and lets the
> > > > guest speculative consume R16-R31, which would be sad), it's perfectly safe to
> > > > run the guest with host state in R16-R31.
> > > >
> > > > That would avoid pointlessly context switching 16 registers when APX is not being
> > > > used by the guest, and would avoid having to write XCR0 in the fastpath.
> > >
> > > For now yes, but once/if the kernel starts using the registers there's
> > > no way out of writing XCR0 for APX-disabled guests in the fast path.
> >
> > Why's that?  So long as KVM uses vcpu->arch.regs[R16-R31] as the source of truth
> > when emulating anything, there's no danger of taking a #UD in the host due to
> > accessing R16-R31 with XCR0.APX=0.
> 
> Yes I agree with that. But the unavoidable part is the XSETBV because
> only the assembly code can run with XCR0.APX=0. As soon as you go back
> to C, including during the fast path, you have to ensure XCR0.APX=1
> again if the kernel is compiled with -mapxf.

/facepalm

I got so focused on register state that I completely forgot about actually
using the registers...
