Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4053FD15E
	for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 16:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814535; cv=none; b=qjxvg0YCbTq/VSpn+RSXM5VgDU2hga/eHXxNzKo3xBrVFoWmwbeCiqW0bbG+P3QpBgNOPDSzHz8F38EihQAVU4mVEXmw6bQuhsNC8cNGP5sza8tx/cys39UlrhQ21uUC5ZuS+Bq7pbN13YjijMdmoqVoGvvPE2Nr1xv7DoF7lWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814535; c=relaxed/simple;
	bh=lS88pgO4vl0WQoEIrTfiXdwjUHeGJQ0+p5JkXjqIuL0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PnvAFp9xHcON2Ik2KG8JDgXCZOmPWaUlcFiSMP9pqZqhsd+DiiIAcW/VwROnCGhWHac95Jj6J1OzZKIv7QkSq54J5rGdpyAnFNj38WW39Nks6qLn2NnE00tKJm4VeIZHnlsBCB9yV9/AvlgCU4f3I0+5pPYEx83qZMmLUOCRQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjU/0FlH; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjU/0FlH"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82fa860e71eso5413426b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 26 May 2026 09:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779814533; x=1780419333; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LZT31wOgcdRUmGTT5DQeYgf6s1URS8IbeXG7+gb+Vm8=;
        b=NjU/0FlHcTbYAf3OCsTvpOkq5QwvFIC/2Y3UfBXe62ehXT53cWn2GAaSOtESU9OT5v
         rOUrNPCo8EyD9V4tZC6dkJu4F6J8KqKMiGbBDuBtIWQLtWueG7O+tloAjtuAJqqU4mPC
         GQDJvtV82kffPOz52fmOYdmNTPVdwxoAxQDqzjlfj1HO723aENIgYzZi2peSvM+LJnlc
         YJg1zD9oHQxiIv4PS+5kwAradAZCy9tDLCttleLNLOPkVqgIBo50bolzVhSjBdKxxjcc
         OdEQzWhYbcys9ew59TS7ylZBKPpHsF0ixBhKXwaU8ohx1d+I9H0jxCa704Sod4Ql3v//
         9dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779814533; x=1780419333;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZT31wOgcdRUmGTT5DQeYgf6s1URS8IbeXG7+gb+Vm8=;
        b=TZ4Jv8hbggkglXWgQks7OJQ/Gdg5dcPXAUt4T9Zyq8D05eTs46VdmOJNbqpmElynCK
         h1Y4oTXAXfy+PlJSZTq+ttbxu2Q/6okKkDUkRUZvYeWk5R91VyT3m0pDNeJOQeGXIRCY
         a752fdqao7/0UzYWkCT9W9XNHOOlakz2Ij1+tDhfCKhN2FdIpMaNAB0+F8ZGPNi11NSj
         rbVVg1XNTSoEEAmp+4AG6RiTX9Ig6vJnd8ZZ9NIX3vMP1I1PZ6q465IPU//ETLo8x1WB
         BycNE4YRqNe84QuMdZsiDviBfMAEcCzl11vUESl+64jSZ79EQ4xinjPUKoN3NkvjtrFl
         8PNg==
X-Forwarded-Encrypted: i=1; AFNElJ+Px4+8OI/9P8kYE12IBdHqE/pY187mj9fINRWHvdcOauDQbROH/uQf9m/tKr/9LWLyfYMYsc6HlzTS@lists.linux.dev
X-Gm-Message-State: AOJu0YwoA3z4ScDRSxcgvXOfZHFfhYyZixKdH+4/zg2OPZhtHwPhsYlo
	E6+hMnye9rRIgldIkZxI8tpE/sdIu1AIZgvNworNZDjZQWIGC8Hyq+xnllhUTViYnrzz2Fs8DFv
	0/MWtJA==
X-Received: from pfbfx7.prod.google.com ([2002:a05:6a00:8207:b0:82f:6245:a6ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:298f:b0:835:3d5e:1dd3
 with SMTP id d2e1a72fcca58-8415f586b5bmr17521220b3a.42.1779814532656; Tue, 26
 May 2026 09:55:32 -0700 (PDT)
Date: Tue, 26 May 2026 09:55:32 -0700
In-Reply-To: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
Message-ID: <ahXQhE1EUzlyetq5@google.com>
Subject: Re: [PATCH v2 0/5] guest_memfd fixes for bind and populate
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Zongyao Chen <ZongYao.Chen@linux.alibaba.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 22, 2026, Ackerley Tng wrote:
> This series is a group of fixes for the bind and populate flows for
> guest_memfd, and fixes some issues reported by Sashiko after reviewing the
> guest_memfd in-place conversions series [1] and another fixup series Sean
> posted [3].

In the future, please don't bundle unrelated changes.  The SNP specific changes
are related and should be a series, but the signed integer thing and the lack of
error handling on xa_store_range() are completely unrelated, because the fact
that Sashiko kept complaining about pre-existing issues.

I totally understand why you bundled these together, but that obviously didn't
stop Sashiko from complaining about pre-existing issues, over and over.

Unnecessarily bundling can lead to exactly what's happening here: the three SNP
changes are ready to go, but the two unrelated guest_memfd changes need new
versions.  Which isn't hard to deal with, but it's extra friction that is easily
avoided.

I'll apply the SNP changes, and send a new version of the signed vs. unsigned
issue.  Please send a new version of the xa_store_range() error handling (or
prove that I'm wrong).

Thanks!
