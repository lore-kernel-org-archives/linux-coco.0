Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B211367B6F
	for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481235; cv=none; b=DqL+4o0Am5H9X5SW/qrfh5rZh7GhJvtJnMxrquUEA8umjgXkK1+/jNfEgW7NQKmuVdws3rcDdfbaFEprzl161o5ZF85cwJ/++fN65VAbElEUx2Ypf4Gidnmp8t7LnbyqGCOEWtygdnQ3+QuEJi0sSDbTwC31NoLCNxGsemaYwDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481235; c=relaxed/simple;
	bh=dUjR5VVk2wCNrZ1Ap0wm0ypuZi/AZCH+XXIJOu8WIFk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u0fp1NbuLtb40amNLcIMrf+VYFB6zn7UEK4bOYcfAflk4ece5MWrcHrje/M7yU+3H8pWRYhRUDF1yDkp71UoqpD8nlPEqb08vlWFbZoWTuyibpX0KVTBgdAlZSgNwu6Uts8lDzP2dWP2EfI6gWZxWTnwFm4VO1Tq5nSH71yF0fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QykTQwg7; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QykTQwg7"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a2639398cso7142820b3a.3
        for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 07:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789481234; x=1790086034; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocV24YaOpEhXgOxf7ysBfgsFY4XTMXobXdtS4MklkkQ=;
        b=QykTQwg7sKQpiBQNLdiMkYTrLaK2kfBcyiniBGyCqL9FI7THKtFp55LgM6sMuNoD51
         La+iOscYLOG1iq/TxjjsguiyzX3TZqJc9xikega6XIroG+GPIIq2K8tlrz/betSTvH1t
         aZsu5E562v3Yit/a2AvuzlleVnAUVrGGAO97CqWJ5am4d3U1MxgIIFFuiFEgeSnkZ5R3
         nl+GtH7jDpHVdOh+DCM1mx/Cy0d0PHclRodbIGDLL+MIgXioJqhRU8lB5K47DJOE1PI0
         GstF/Aj6lFFrP/t0NPlfVUkAtEY/8G9Xx4oEUBE7aCdl/YAWtZuW0NvSuBYr+UMZu4Ap
         5/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481234; x=1790086034;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocV24YaOpEhXgOxf7ysBfgsFY4XTMXobXdtS4MklkkQ=;
        b=pD9adAKI3Nqo9uZj9suuLJN+WrKy/ubFRSK1v3nKnkYTCfu03UP/ZVIiz4wkR+p1w6
         tUJwLbdSiiKL9nrTLKiQteY1kjRq9TtJfQp3j15dAZj3cQqpMGtEfUNioyDK4Gf/lbki
         0eku/2xOX7CZBD1OJ5FIO9JYxhNkBYRNKb+TvWu+Mgf7xB800ufrSYJc4pnZbslVl026
         /+eLkQ41EHelPN/ACW0MMWk73QSnZMGP0t4aAYavwQ3HPqrioT4C9qk5XFK7AEHNqRmM
         gDJlgA9g3qRbAgZeRfOKEzbALjf6s9US5kJNpa830nV/fk9UDNIgwKBGquC0dxGIfq4R
         Vi9w==
X-Forwarded-Encrypted: i=1; AKwUvBxcYk8I+FYGtT4E6f2IV+X/iyUX3Qs1F57wzkgzwqew5RB5+tMihqQtPPqJ8HRpN1qjeTll6WwCpQrK@lists.linux.dev
X-Gm-Message-State: AFuF++md4CSneps4NKi0sk1Fh8ycaCFH6zRasGVTbHyZmJxuisKGpAq2
	RqAFyc+kv+wrmkFTplJMxRVz+Q/LS5wR5V7vpseAdRW8R5LK6tG1nVbNzLIJ1/DvuCR3MaDmG6w
	dDr5JpQ==
X-Received: from pfch11.prod.google.com ([2002:a05:6a00:170b:b0:86a:72b7:1388])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:e86:b0:86d:117e:5dd0
 with SMTP id d2e1a72fcca58-86f83055846mr14705977b3a.5.1789481233641; Tue, 15
 Sep 2026 07:07:13 -0700 (PDT)
Date: Tue, 15 Sep 2026 07:07:13 -0700
In-Reply-To: <20260915092632.2822169-1-peter.fang@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260915092632.2822169-1-peter.fang@intel.com>
Message-ID: <aqlRETiO58SWjFLF@google.com>
Subject: Re: [PATCH v4 0/4] tdx-guest: Make Quote buffer size dynamic
From: Sean Christopherson <seanjc@google.com>
To: Peter Fang <peter.fang@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Tony Lindgren <tony.lindgren@linux.intel.com>, 
	Artem Bityutskiy <artem.bityutskiy@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 15, 2026, Peter Fang wrote:
> Hi,
> 
> This is v4 of the series to make the TDX guest driver's Quote buffer
> size dynamic. The only functional change since v3 is an updated
> TDCS_QUOTE_MAX_SIZE encoding. The rest is documentation, changelogs, and
> stronger page alignment for the Quote buffer size. It also collected RB
> tags from several reviewers. Dave, Kiryl and Rick your review would be
> much appreciated.

Where is the breakdown of why "generating quotes entirely within the TDX-Module
is too complex" I was promised?
