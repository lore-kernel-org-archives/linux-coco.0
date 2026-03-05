Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B0D2DCC13
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 19:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737657; cv=none; b=F9R7w16YQuqELXzO9V2X373I0AWpPkEmfHp9bUvrlwARnNWQPKKgVcdgTjg52kg+nzREuQPWSIzeGRjHLTOl7DqFAq7k2GmVEqD31A9tAV9HnmeAleI4KKd8FCqdlRLOVtnVSWlfuuER/cWts/XwPbKenGwLylyFIl7qXIUbEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737657; c=relaxed/simple;
	bh=w0X3N8sFCQEBgD5yEveEJ43+yCciQZqBxhhVxI62qSY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VXMJk7F1Y53w2Rb4VBfncj9QO69w0HmHmvFL6H8/WMBU+7wYi8tSEmKCIcG/g30XZ5IqzdW+DbkomnXll1lY0J8kASNZibVExfm38+h+cGWObOrbQ2nWqJABHvOUcl3x6MDMOKdzEhlQkszt47dQM7LRMhMjMqUE57/VGCPO2+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ge3CrKps; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ge3CrKps"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82739095656so3279145b3a.3
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 11:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772737656; x=1773342456; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcJ0mjA5TJQ4bh2w27jq35LKUnDhiU4/pHqlNtaddJY=;
        b=Ge3CrKpsOzobAGFp0VsXLTRI5Qm7VRBghro4oWJvqeInrukZuBhJTA9tTNUDXWB1/H
         rkFAr4YPww1o7pjImqTeDyoDZUfqwXxtvIfIdZdrLTGK7LNuPkE66FJTgmwxiAxk1ubt
         6eGan9nw9fe4zEo17kiJpiVdnzZMzla5GLtybeUMBh2lXmxqWEMBUFtnHDRyuS+/z7IB
         Iy5QZRB7bWoTEpOktuAgdq+L7IBqimACNV8B0i/exeny5+XPQu7r/Yu56Q4AZawBvlj9
         7xozMGWxFBWXOtVBn5Nhl4IJwb6VgbwBT1+uQxBxOePivUbTDdMYFMiso2P3fI1YROe3
         ZNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772737656; x=1773342456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcJ0mjA5TJQ4bh2w27jq35LKUnDhiU4/pHqlNtaddJY=;
        b=S76wrVAoA3vJijFIe2GLttXpNqzDTDB1vXUZ7N/6fGHQJ1cThuubmrlVZwgnLz0DXX
         77OnAE5uecV0fmanc4zzhmQSWUCVe+z4f3NyBSwL1X3thxMNJr9woXi065uOopihgZtu
         LBEmRjzvmN91Yx4NBANp10k/5P+Qmkd+cy6ky+GkeEi3vZhgrYk1/qOlOJKDyJYw9sN9
         8bRvj5oS5s+e+/mlUXEVoY98d7XbLiy4cWwiA6VDAlS0pN/cXzItFn85V32zaKo4zPV3
         OqHRlflN6TEjk4kUqiaOn4kr5Akgdf5t7Op/lIKwDDXBvdFXL5qra7H5zZbmf+8v0QFX
         /Fkw==
X-Forwarded-Encrypted: i=1; AJvYcCU8JqTcSST/Mrkl+wPRjdI25nrGxGjZD2NNo4fSrc9yLwsZHzZwhvqI/jJIiVm1uqT2GC6FUspYLeIn@lists.linux.dev
X-Gm-Message-State: AOJu0YyRj/scOZRQ6Q3lTod7lBEipySW1is0sV1kHHqzCZg1WdQqF0LS
	E4N8cxN2b2gzodDYkSrUpYr1SLNOIjbUMQrSt1Ei2DkKI1BfUDHUuRWXix882NF7q5subZJ0ilD
	AmuCg9Q==
X-Received: from pfgt42.prod.google.com ([2002:a05:6a00:13aa:b0:829:7f86:634])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1916:b0:81f:852b:a939
 with SMTP id d2e1a72fcca58-82972d8d990mr6555196b3a.63.1772737655656; Thu, 05
 Mar 2026 11:07:35 -0800 (PST)
Date: Thu, 5 Mar 2026 11:07:34 -0800
In-Reply-To: <00406192-932a-4cce-a579-48fe18b9f777@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com> <177272960351.1566277.2741684808536756847.b4-ty@google.com>
 <69a9d0645bc31_6423c1006@dwillia2-mobl4.notmuch> <00406192-932a-4cce-a579-48fe18b9f777@intel.com>
Message-ID: <aanUdsXdskcugrqj@google.com>
Subject: Re: [PATCH v3 00/16] KVM: x86/tdx: Have TDX handle VMXON during bringup
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: dan.j.williams@intel.com, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Mar 05, 2026, Dave Hansen wrote:
> On 3/5/26 10:50, dan.j.williams@intel.com wrote:
> > My proposal, unless you or Dave holler, is to take the first round of
> > TDX Connect enabling through the tsm.git tree with acks. This round does
> > not have kvm entanglements, i.e. IOMMU coordination and device
> > assignment come later. It also does not have much in the way of core x86
> > entanglements beyond new seamcall exports.
> 
> Sounds sane to me.

+1.  If there aren't any KVM changes, ignorance is bliss :-)
