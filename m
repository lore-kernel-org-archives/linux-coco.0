Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1DF3A5442
	for <linux-coco@lists.linux.dev>; Thu, 26 Mar 2026 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549536; cv=none; b=byVrZkC6JWKp5PU5pxd7UAgjk+a6BqL8xj0DuL7/gjzDeeOMIxsKUUWPDVwUK1eS6t9KyMQllL+SIM/QrWTjCFZXVUnYBvfLEFH2GSj9q2uIZkOuucOIkC38bdQ3p9UIy5zJW3OKxfbHkECQYPI5ywjm2xFPD947jf3m4LxwNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549536; c=relaxed/simple;
	bh=Ju4GuypyYdw0ImWV7ufhXgfThhO1xwtog0FALkHkh7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pX4toL64DxqZwJQa1Y4Du+PZxI0lbO/kMjk4oMTocQnasfEvYeP7kTamhBviDD21KdXA1fXNYIS8jHK7/rJy/2Gsxa80GKWu5TL19K5HLu4TRZKGWUHKneIqMVqsg1NPlZtyrVHxJXNzqUCZVftu9weDmsD0Prc+xHhGZMNi1ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WAY0gTdh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WAY0gTdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774549534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ju4GuypyYdw0ImWV7ufhXgfThhO1xwtog0FALkHkh7Q=;
	b=WAY0gTdh6Yf7pUGionykx23jVOQ44COTnkmAwdg5AGmWt58YgvEaIlJzPE/bx2HzrbZtot
	EygbusRXg5DmmTFDnOFUyHYOO3TF/yeEO4LeU/3bcsKuM+0hT0ANoWSDELCqkIxcKqtPmx
	TpHkOxbBTtLKkndinzqxmViJj1cmpRw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-uqeQnx6sNhiBRN9bwQ11Yw-1; Thu, 26 Mar 2026 14:25:32 -0400
X-MC-Unique: uqeQnx6sNhiBRN9bwQ11Yw-1
X-Mimecast-MFC-AGG-ID: uqeQnx6sNhiBRN9bwQ11Yw_1774549532
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43b9a86b9b0so375062f8f.0
        for <linux-coco@lists.linux.dev>; Thu, 26 Mar 2026 11:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549531; x=1775154331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ju4GuypyYdw0ImWV7ufhXgfThhO1xwtog0FALkHkh7Q=;
        b=pa8Cro5r//td2NONmCkOpO3sW3Lu6vqPI7FT4YdbsWOIzhtrRbqRKhHQGTG1CEWdEk
         9Uxd60zTaJ1pJ5ql06A6sUyTmggyOdBrKPPuI1yqbJahNzHcV+o8XzA9kKq9293Ce/7x
         fhNgQ4tXGPTgYmCNw4DTxhYxiS98x0C0HxgwGjVL06UE3c6/ZbqM/I05PBNpElIS6YKY
         QQS9cVHrYvgWyk7UdAkYRQCflWsQ4iHl94NospoNvlNZSLAE6TOo/0tXjsZK0E35RfHg
         Pdn59l2hEpX6yXK1OkPyZmfZ1bzs9INCgNgBfvf+ncES4tPP6syP9G831ueXE3otr91J
         8NRw==
X-Forwarded-Encrypted: i=1; AJvYcCUMVXtaNPWsLPvnbcg7Kj6ptZfK3DiXPwfCBcV+58NV/m2IbyVxvGoUNYOok8Ae/HZKTQiiKbX2xDC+@lists.linux.dev
X-Gm-Message-State: AOJu0YyosLoKfrXuvLdUxtrGtEm9uW1mSEzok54dbt3nsHt5ULTd0oRM
	vdrb2SnRTCdok8FFrM87FvYldQfkNMAYEknYnB4gjBaTszWkBa6rFPnTrjI2aky9KqooL//SCqu
	Bv27uo+9VLAFRTLNTGrSMqQAhVQx/VhCDQQExFwBsqUaDue02RD9o+XAENXWS8G7ZLdPdVOcgOI
	r+tfiP7aS7mqVG8/r7m3b3QrdXSadIQy7TQujzSg==
X-Gm-Gg: ATEYQzy7Bt/f3hbDQxu9IG2Bdb5Dc0/Tn9Jw4Vc7Ao1cF8/bpH3eeIOQZQ2cRAgfKA0
	bq6kbGy24S6QPA1AlMpFsZqcQIy0Ib54/OWZg8a457KpJSjrxCgJ4qKTRm1MohDURVJ1IekweL3
	Kghv+TjSERhQHyyBDeec/GioeYqv4Zu5Cm6dXG54sxfvgGVwuD8GzlMuwWOJ5GyynC8UbSYVoFW
	RShNKwe2svpVfarVpF8FIRyCmj33xJXugQOVKRlLEfQX4Z1CZxJ4V4tWYyhnsHu+maHlhiKJ5i2
	wJDM
X-Received: by 2002:a05:600c:1f12:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-487160564abmr131776565e9.16.1774549531575;
        Thu, 26 Mar 2026 11:25:31 -0700 (PDT)
X-Received: by 2002:a05:600c:1f12:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-487160564abmr131776075e9.16.1774549531118; Thu, 26 Mar 2026
 11:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324-tdx-hotplug-fixes-v1-0-8f29f2c17278@redhat.com>
 <20260324-tdx-hotplug-fixes-v1-2-8f29f2c17278@redhat.com> <56190adc345148396ba6b3e52672e662145f7dc7.camel@intel.com>
 <CAMxuvaytU-pM+rviUbNGWMhvbAYutwvaSXW_O=sn+QfOzF35Xw@mail.gmail.com> <7802b50589c80a7276a50cc473c1aa579750a30c.camel@intel.com>
In-Reply-To: <7802b50589c80a7276a50cc473c1aa579750a30c.camel@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 26 Mar 2026 19:25:19 +0100
X-Gm-Features: AQROBzA4Xxa8YCmGcRxu79Svr4HUz2dOQ6f5ejBx1X38OfhAGi0MWHQBY_m3IsA
Message-ID: <CABgObfZ7_w8Q-dW=Sd4YA3P==BuN1edPv7Ty4EpPyU8ctW6RLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/tdx: Accept hotplugged memory before online
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, kas@kernel.org, "Qiang, Chenyi" <chenyi.qiang@intel.com>, 
	"Anvin, H. Peter" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@kernel.org>, kvm <kvm@vger.kernel.org>, linux-coco@lists.linux.dev, 
	"the arch/x86 maintainers" <x86@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k0QjKEZwuJaxB7pQpnykRinY9ztWB5ghcsL9hi7Z7RA_1774549532
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Il mer 25 mar 2026, 18:21 Edgecombe, Rick P
<rick.p.edgecombe@intel.com> ha scritto:
>
> Ah, I see now! So the problem is not that the kernel is accidentally
> re-accepting the memory. It's that host userspace is not actually
> removing the memory during unplug. Hmm. Why not fix userspace then? If
> the memory is unplugged it should not be usable anymore by the guest.
> If it is still accessible then it seems kind of like a bug, no?
>
> And! This totally justifies the warning. If the error is ignored, the
> guest would think the memory is zeroed, but it could have old data in
> it. It's exactly the kind of tricks a VMM could play to attack the
> guest.
>
> Another option could be to perform a TDG.MEM.PAGE.RELEASE TDCALL from
> the guest when it unplugs the memory, to put it in an unaccepted state.
> This would be more robust to buggy VMM behavior. But working around
> buggy VM behavior would need a high bar.

Wouldn't it actually be a very low bar? Just from these two paragraphs
of yours, it's clear that the line between buggy and malicious is
fine, in fact I think userspace should not care at all about removing
the memory. Only the guest cares about acceptance state.

Doing a RELEASE TDCALL seems more robust and not hard.

Paolo

