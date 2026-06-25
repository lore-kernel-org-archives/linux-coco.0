Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1882F60CC
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782410520; cv=none; b=uzgp6H0P/x31MtLfYzcH5skDxSbGEo1DAFP2FxxsXFcBQRuNNuEtoLD+rWFgiCrMfLGYJh+ivO77U+evVcO5nT05ZltyzZSNnJf/ll+jJoKk4P8PvR2+aDNMFpuJzsO5/KDk1AF4isnxdt5mLneWgJyn5TlLIxYh1PvCdLeASTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782410520; c=relaxed/simple;
	bh=AWA1RyC3DW+Gbn4npqgD5CoqZo4JbHLfF2ZhLzS2+6k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mZJKDy9vnHRXSb0usc5wX8tPX89KQWyI+gNeor7+NuUAIpmUf8Rw+MbGVp7Tvz/OeBCEhhe1JrbwN7IByrsJ3tLUgBEFrx9McxTdrekBIdo0XcKj+P0Slahrg+XleEEmcReQ2AXWbye/40PWdIV7qtoNBbuf/zecB+eWcQ+DI7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UAvy30pr; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UAvy30pr"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8422ca754d8so14172b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 11:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782410519; x=1783015319; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9XORV0MpbLe0TPyqpmXBTUptzOlLBIC6P4Y0TjKtCc=;
        b=UAvy30pr0dVaQQyIVUY+avcDX2R1o5pXwXi46dLvdTxjx+E6MthYb1mi75rxlLKA0b
         J3kMlPutGy0nMVBmp6Qu19LGtSTMytTbCDkRcM6odByTJ7c+ZIjlhF6c9PYecMUrN6nE
         isgIKGNziOBJns/ByMhmg4Bw9XG/m4/u0nIw6E4iDNXvVQ0U/7VUlgOk/MMnGZiUqqG3
         9l8nYj0pmt0edmxCivb4LYNRr7ZP1TxlfWUV4LN/ubMEWAvi7SV0vgZPQdrioEuMGlNw
         KX1TCGWDSTjEvIxI+UokKWZa99kOeCDjWsMGt9x+UvHDJe7N1VxXlow+q4I0d1lGtyBg
         uIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782410519; x=1783015319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9XORV0MpbLe0TPyqpmXBTUptzOlLBIC6P4Y0TjKtCc=;
        b=UH6nb+qiuIo5gQnVziW1BDvB22XisbjSoWczWJiedjQrzj7gFzOLn3N0pyAvkbfw3G
         WCNSuuopqSGsCnFsOup5sOqYeyikqa+dX3w+8Cjmrcf9iB0SumhkUoEklPEeJC0SWe/m
         z3c7JLcfDtAX4LE9k5KhHrR8KUcXVBk8NsUrgUAeYAajRvAVl3ZqqMQe/deT9h+dPpeW
         uBT9JkjWOUfzlc1iMQW15QMfuP3jTNBYAS8tcLU6QJlwgk+6fIp1G6v+3WB68mTePy/D
         fkNJfj1Qb19EqsOB5d/LILAcyeCOy3H/EaVC8r6s9mQnNyzs3c3RGmgC67PO+xR398Kz
         UAiw==
X-Forwarded-Encrypted: i=1; AHgh+Rqm0IsleRz8U0V96kmoFRd9KjvcjPaB/8hrrl+2mESys1HAWYtxMLb+VzJcmq5MW20FuBXwaD8l2qao@lists.linux.dev
X-Gm-Message-State: AOJu0YxzdtcpKOmaes08DqD3GY+x2hHFFB0Nx+S+qs5fA9JIDndaDqC/
	IfW+fwDm1/qQAs0YgIcoF6YrqLf5TwrU7mI3igQXj6RR7ajrAHyMcTcZNqZwSnO6FS7dxvTIE2F
	omAQ3BQ==
X-Received: from pful12.prod.google.com ([2002:a05:6a00:140c:b0:845:5d45:e510])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:438e:b0:842:5a18:9af4
 with SMTP id d2e1a72fcca58-845b39e85bcmr4011361b3a.18.1782410518627; Thu, 25
 Jun 2026 11:01:58 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:01:58 -0700
In-Reply-To: <20260618081355.3253581-17-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618081355.3253581-1-yilun.xu@linux.intel.com> <20260618081355.3253581-17-yilun.xu@linux.intel.com>
Message-ID: <aj1tFuwZWdPGfUoG@google.com>
Subject: Re: [PATCH v2 16/17] KVM: TDX: Add in-kernel Quote generation
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: x86@kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, djbw@kernel.org, kas@kernel.org, 
	rick.p.edgecombe@intel.com, yilun.xu@intel.com, xiaoyao.li@intel.com, 
	sohil.mehta@intel.com, adrian.hunter@intel.com, kishen.maloor@intel.com, 
	tony.lindgren@linux.intel.com, peter.fang@intel.com, baolu.lu@linux.intel.com, 
	zhenzhong.duan@intel.com, dave.hansen@intel.com, dave.hansen@linux.intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 18, 2026, Xu Yilun wrote:
> From: Peter Fang <peter.fang@intel.com>
> 
> Provide an in-kernel path for Quote generation when handling
> TDG.VP.VMCALL<GetQuote>, without requiring an exit to userspace.

Why?
