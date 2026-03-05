Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437273019C8
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737708; cv=none; b=nvajSmTLB/gKOkQjTFM7F8If5GMfIYRB/AaqwiDhn2xR1DXAzd+ZgltukRxFgHrfPEGdNidpdLjLABPl7u8x+fEQ8hxhaMIloaX/bLRLbZuZJ9A7PsP4H2qBwl57MHWB9qA3ZHQ+Q4f0e+GwuHFpNqfFXaGnuTxQ7EzJSs7h5fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737708; c=relaxed/simple;
	bh=bGuaeNqr6VWaAmbiXSPDtO63UndDQutthS6wDXTX9W4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bgfLLMgcW7MwssnJ2i4U2ppvccXIUyiuxPmDl51lRnv/5xOtVU5Tfx4jmIzxi3yZDoEtoX/E8OJn9EaljxXRJQzifUOT61FhZv/SS59vEt7BIbPVnvc5xNubMiEDP2bYSIBSqrddFT6nVO31j/mzBEffvAZVR8Y34sKHzyJUy8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0T/ET1sn; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0T/ET1sn"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3598007eb74so26711018a91.3
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 11:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772737707; x=1773342507; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd+7isUxcEtu9dXZzRy3nxo9ohGQnZS7iF8S+D9SDgk=;
        b=0T/ET1snlKw9oEclx/gflPl7jl7lO+O1/kuXkEy7x6xtfCBbO6xfit4IdEsoQ3hiix
         10TG4LdYrcnno4mXaxQdFR7ctbGkGDeNc3XT4Zzqc42p8SrulUznoXN4AvbKNI52ocgc
         KBpAsKqVvGusuSgQbTwUJXA5m1a//oWIjk07Kh9a5UMhJAgR4nyxc9VkGPYea3vVQ9ag
         mzqyBJUuGdF7Osrk6wJDEE341EvFBKNxvnz4a1cA0OsmYzimzhmsRBHnJ362NOikh8q7
         K900VfcXM9iIgKdr1ny3pIAKmSD8yHeSg0Jl5gDblbbrGZLAQ4smd+QDkGddoSEc9nXT
         Pkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772737707; x=1773342507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd+7isUxcEtu9dXZzRy3nxo9ohGQnZS7iF8S+D9SDgk=;
        b=bnRso2cdi5nHduueR0bcXqRrLY6WVSW0JwLt1zrSPnYH+C8N89Qxws6TaddFm4qAPk
         RQ4kywwlbkRlF94iPKqB8gfadqw86fGsacFuKVizcUdMc+LnNT4QdMm5fxa6WqHdjon7
         rC5jiRbka6r7cPAT40r99Ken6oE9Oxvc9Rzt2lemyJB6SDFTol0YfEURawikgIxm2O2+
         3r7bP/8ptXiZ1H+Ps8cWNCP7e4/YNx5j/o6BQIwK3F2O0Jeaa3JEGxlh0UR2ztGwkuTG
         ZNgLS6WE9Y4V+h9rcrIMFhKz1rdjC47dqbyVKrfHOSHiqzTsdzpSjR1mwE4QnA/kDmFl
         CnOA==
X-Forwarded-Encrypted: i=1; AJvYcCXsEul0LT2naVTjyekjmH3WSfX30/rBJwwMKPxOZaplbmIxXx76c195LptocvhiHWNeNbqfZ9lmUw/D@lists.linux.dev
X-Gm-Message-State: AOJu0YzcfNTs9WE+TGVnQRDPNr6hRIemrokMEP/3EYJxhIW8fb+sf0da
	UwfiOSf9wXZ4/mT8UPb7YYxxIdbx4zvoO3SagzJuPfX6Q+5TlAVUBIVQ961TzJfFDpHdZbj73TI
	0pARH5w==
X-Received: from pjwo15.prod.google.com ([2002:a17:90a:d24f:b0:359:946d:cd28])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cd:b0:354:c629:efaf
 with SMTP id 98e67ed59e1d1-359a6a83ecemr5537189a91.35.1772737706499; Thu, 05
 Mar 2026 11:08:26 -0800 (PST)
Date: Thu, 5 Mar 2026 11:08:24 -0800
In-Reply-To: <69a9d0645bc31_6423c1006@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com> <177272960351.1566277.2741684808536756847.b4-ty@google.com>
 <69a9d0645bc31_6423c1006@dwillia2-mobl4.notmuch>
Message-ID: <aanUqJWYMSXSwGRR@google.com>
Subject: Re: [PATCH v3 00/16] KVM: x86/tdx: Have TDX handle VMXON during bringup
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Mar 05, 2026, dan.j.williams@intel.com wrote:
> Sean Christopherson wrote:
> > On Fri, 13 Feb 2026 17:26:46 -0800, Sean Christopherson wrote:
> > > Assuming I didn't break anything between v2 and v3, I think this is ready to
> > > rip.  Given the scope of the KVM changes, and that they extend outside of x86,
> > > my preference is to take this through the KVM tree.  But a stable topic branch
> > > in tip would work too, though I think we'd want it sooner than later so that
> > > it can be used as a base.
> > > 
> > > Chao, I deliberately omitted your Tested-by, as I shuffled things around enough
> > > while splitting up the main patch that I'm not 100% positive I didn't regress
> > > anything relative to v2.
> > > 
> > > [...]
> > 
> > Applied to kvm-x86 vmxon, with the minor fixups.  I'll make sure not to touch
> > the hashes at this point, but holler if anyone wants an "official" stable tag.
> 
> Thanks, Sean!
> 
> Please do make an official stable tag that I can use for coordinating
> the initial TDX Connect enabling series. While there is no strict
> dependency I do not want it to be the case that a bisect of TDX Connect
> bounces between a world where you need to load kvm_intel before the PCI
> layer can do link encryption operations and keep it loaded etc.

With a timestamp, in case fixups on top are needed:

kvm-x86-vmxon-2026.03.05
