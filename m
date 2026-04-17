Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EC9346E63
	for <linux-coco@lists.linux.dev>; Fri, 17 Apr 2026 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776445188; cv=none; b=Gj1JeAg1kbMKn/gUadCpsocwmmdZErQVTDgXTfgiQT34yEFu8iKpKp5VpBJiVezU1CmXs6Zu/UqGGiYD9IBuLiCNfm5WMBz465F/r0lgUNWvRdrcmYAq3NtsIk6Vgkll1tnwKjtz9RSgMqTF8EbXoYTnfG3MYBdQf4lmwzmAkUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776445188; c=relaxed/simple;
	bh=fMsQaBkPIWlFvTddq3pkA/GSUQ4jKl6XtjEyjYg9b7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tY742Df/28BwArQOppo07lRrZSekVosicFcqR0ZaFZ82aUSb+7g+xMXBRNL4rogy9WYsKGod7luUQKfRdEelvmeoEZxO2rhZ19m79utW1PtGW11c4f08ywDTsoRxkAg7FTH/fHlXYRb7ExqparvJ6I0m3HAGhOTzPYO6DF+7Iz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WGALQAep; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WGALQAep"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c70dd30025fso1173437a12.2
        for <linux-coco@lists.linux.dev>; Fri, 17 Apr 2026 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776445187; x=1777049987; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xpUE/ibC3YyCoGenWCVFz5lepygm50eO7SK+GhPCXc=;
        b=WGALQAepjsYmncW47LJiF8hvr7578XtVQDYVWaUCIoWlS22RVMMMMu8f2/+XF1YpGF
         v8lGxe7vEVvmnc3VrQ1JIfzrCY3qIgfXa1f1qfqx4BnGkkXodZOwIeTJ8Co9e0ByWy5n
         pCftjIaPjg9NHFZeHgZqkoPRDOCAkBwapFubc49BCQTBe3V6PAWouUrUzi7VBHJ8ZPah
         XayjfZ8qOuiEFY/g3U8U9hxxyS3jQR7yg4fM+dEjv7skqzOyzmopF3zzNLhNHEiBSWdq
         iIy3VgfHA4soYocwpljIDWlgANFszeJvUpPVEdgFybe/lnaPNG5ZwwvYDMoApCYUGLnC
         qSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776445187; x=1777049987;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xpUE/ibC3YyCoGenWCVFz5lepygm50eO7SK+GhPCXc=;
        b=ID7T5vpiDB+mjvauF9/VUL+a6VxqHvuJXNmsUqOmrPvfcqiA8qfZ27sJ8K+WgGe4Jm
         3sIZnHy+mwktP8y9BCaPZIxaYohVhzLF2BrZn+H2MBtsCaXMuAXQlnsUx2CEo6U94kNx
         bknJNwf5Mqy8Q9RRJFThotz0CNKh9mNfaQe1o5+s2IIB6xfQmXqBpIiJ6m4c6ghKaZoU
         7CroGwhNh4GqximJisOsXlJW1/uE/7eHcXkrW87cMZ3fk/atTLpmiPIOhsvEAIaZct7u
         JumuNfde2r6qqjTPRhcuTpaTr3W2Ke9p+Sy2rIhSn3n5HYtiwkoLyHBTmXjBcRxr+INM
         PYlg==
X-Forwarded-Encrypted: i=1; AFNElJ83jxSlg1e+iTy/Ep8nWPffZXCpopoZisw1YXA0gOOVn2dc5y7GKLO5X4fh7I7sYQ4J4uS3RO2krxqh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5ZbchMx0uZgmgl2o9WyNYST/VgeZB9dMxTwCNqRX0qRGYkPBq
	NZQqEPFLUNE5GitQwc9NAP+yNWzhlV/mxkNuna9xtJSe/jYqJkydd37muGZaF9QeuKOfVOcA5/7
	el876bQ==
X-Received: from pfbic16.prod.google.com ([2002:a05:6a00:8a10:b0:82f:8a3b:87f0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e26:b0:82a:7aa3:a2fb
 with SMTP id d2e1a72fcca58-82f8c8f07d2mr3805935b3a.37.1776445186761; Fri, 17
 Apr 2026 09:59:46 -0700 (PDT)
Date: Fri, 17 Apr 2026 09:59:45 -0700
In-Reply-To: <0f25c1c247c08f19d36ca774608bc8162d2454a4.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <0f25c1c247c08f19d36ca774608bc8162d2454a4.camel@intel.com>
Message-ID: <aeJnAfIryxf5Bzpe@google.com>
Subject: Re: [RFC PATCH v5 00/45] TDX: Dynamic PAMT + S-EPT Hugepage
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"bp@alien8.de" <bp@alien8.de>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "tglx@kernel.org" <tglx@kernel.org>, Kai Huang <kai.huang@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Sagi Shahar <sagis@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 15, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-01-28 at 17:14 -0800, Sean Christopherson wrote:
> > As for landing these series, I think the fastest overall approach would be
> > to land patches 1-4 asap (tangentially related cleanups and fixes), agree
> > on a design (hopefully), and then hand control back to Rick and Yan to polish
> > their respective series for merge.
> 
> Sean, were you still planning to do this? I see you're, I think, asking for Dave
> to pull patch 1 here:
> https://lore.kernel.org/kvm/ac_bMKD7YGhMwUCf@google.com/
> 
> But actually he acked the version in this series,

Oh, right.  I forgot about that.

> so another option is you could just take patches 1-4?

Yeah, I think that makes the most sense.

> Please let me know if you are ok with that plan. We are growing stacks ahead of
> DPAMT and the other splintered pre-req work and looking to reduce it. It could
> be nice if we could take all the pre-req work through the same tree for that
> reason, and most of it is on the KVM side. Is it reasonable?

Ya.  I'll apply 1-4 and create a stable tag for patch 1's commit for 7.2.  If
it won't throw a wrench in things for you, I'll wait until 7.1-rc2 to get 'em
applied.  I've been burned more than a few times when using rc1 as the base for
topic branches.

Dave, holler if this doesn't work for you. 
