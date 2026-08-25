Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC1329E6C
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 17:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680124; cv=none; b=oNCHjIFEN1r8CMtn0VYWt8lOvb8a6tPHKluZzVFSpDOMTXRnUWOnG6SeUS3CpvmfsJbistUJRas3e1nlqsd+Si4nV6PSXjq1LLAmx5myMrFMDc5rh1BwT+9k+6ip01w4csO56k4PYCnHTxSsvGBfdRwfanH7POc/DmqfWm47aj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680124; c=relaxed/simple;
	bh=c4O1YuM86p+GvK8W1WI4s9QhFG6ZLMMG+9fo6oalN1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rq+M02624VezxNc+VVszr+UN9XCPJQkr/Xmo3KRYUkXCrYABZiuIoY9fgcKRyj6svxp/rcYQLAM/Y2C66eG2w8xXVgQar0fa00UDj49ThiLBBp8AYG1fbeWeVI5Uv4W0YymNghgLbyE/1BXhzRPiTUWdn45N6pNjckJhTnRu7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wCAwsPQQ; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wCAwsPQQ"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so4784a12.2
        for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787680123; x=1788284923; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfNdtxjurrpQVrdCO19VGPq2Y4QeRrOBNLADjxjp0d0=;
        b=wCAwsPQQGrwRhfVzg6UWYkIHUkmGTO8lOKJEtiYyEpJgcpdRYtY2HfrUf0ERZTobva
         i7wm7haSjL3DroILgZpjitV1QHCAHw7mvbjeh0hEX5ppa587qLj74YM0KzPVlY+f1Iqz
         id3xIKmctCfLuTnTvYdbSLz4GRz7M1HJ/TTiu/zF4DySRP6MMa0fQD2fbJcKvCDmyUjL
         oHO/Rj5ziCkRZc0KDJPHmr08cL/upsjtvDSgOaHKkOGmLpHjg9yaCwwnJm0gBNCDVFIR
         0wlkJoxeiTF9o0YMOgAh4PzoHWXCnsr2VlQbTMjTzXdzBv24T4digPFk7GeVpO6YmeKl
         Vauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787680123; x=1788284923;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfNdtxjurrpQVrdCO19VGPq2Y4QeRrOBNLADjxjp0d0=;
        b=S/fa6gSnG8u2nk7vJ6QgXgosnZ4fcWPtpyySb7mk3Vd/xVr6PPMKpiYOaBf8wj8HiR
         zCkEKagHvQt/G8zzpFH+6u/RxmPqwRc5WrVPyIDB91LLZPtbCjcnmv0XTKQQs3BkOsBb
         QgCtShzQwza8uw76Ka0+YNWZX75imTJ+Ryx6UOvRtjsszI8YcZ4x6SWRyL5suKmEMs7T
         xigg7HabIJQu7ea3AFMtERfFgPSal2NfgI0Q4zghtX1mAro8+IaNSiuD8dkn9O28A/RH
         YHjQcK+QKo/p0ClrBo90y5xr6eT1xlh79XfkYBixH2XTAKWCVNyO/l42NMAETFZuEKCU
         0xXA==
X-Forwarded-Encrypted: i=1; AHgh+Rri2RQhEKleaLwzgMVfLXRmZCZGxZww/RXgcQlFYbJUfvzrWrp1Dfmb/4JhfQL0GtgTupB8P0oxSHTf@lists.linux.dev
X-Gm-Message-State: AFuF++kbKOBZjOzk4+6B4MZk8vShjUNftMX3eCcnMaU4rQOuWRYYVeFo
	HWemDRJN0zi+qfqAVwqP4Vljqu71neZRAxl1NiVHpP6h0V+hVwvzCVvPmImvOQJsVg7AR0QeYZ6
	pt5BBmw==
X-Received: from pgbbh9.prod.google.com ([2002:a05:6a02:209:b0:cc1:b199:ca6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6ca7:b0:84e:24df:3870
 with SMTP id d2e1a72fcca58-8536ee112damr1011928b3a.0.1787680122302; Tue, 25
 Aug 2026 10:48:42 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:48:41 -0700
In-Reply-To: <1f12e12f1d5e7baed6630fd15cea5420c40ada68.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260825025533.25663-1-yan.y.zhao@intel.com> <1f12e12f1d5e7baed6630fd15cea5420c40ada68.camel@intel.com>
Message-ID: <ao3VebUyMVlK_qGA@google.com>
Subject: Re: [PATCH] x86/virt/tdx: Warn on !4K level in tdh_mem_page_aug()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kas@kernel.org" <kas@kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "sagis@google.com" <sagis@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	"tglx@kernel.org" <tglx@kernel.org>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 25, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-08-25 at 10:55 +0800, Yan Zhao wrote:
> > Do not drop the "level" parameter instead, as it will be needed once huge
> > page support is added.
> 
> TDX and coco has so many plans for the future. An abnormal amount of concurrent
> thinking. I think everyone agrees we need to wrangle it by doing things
> iteratively, and cheating when it comes to uABI.
> 
> Since we have TDX huge pages coming so soon, it seems ok to leave it. But I just
> wanted to say having the level arg here originally was wrong. So this should not
> be precedent for pre-enabling of things years in the future.

Eh, I would argue that in this particular case, including @level was ok from a
process perspective, the main issue is the implementation was buggy.  Which is
very arguably _because_ there was no user to validate the code, but given all the
pre-existing KVM MMU code at play, at some point we'd have to insert code to say
"hugepages aren't supported".  E.g. in this specific case, assuming PG_LEVEL_4K
could have been just as bad as having a partially-dead @level.

But nitpicking aside, +1 to not building out unused, untestable infrastructure.
