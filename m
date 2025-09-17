Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447D332A36
	for <linux-coco@lists.linux.dev>; Wed, 17 Sep 2025 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758121362; cv=none; b=Lmnl7Oi3FbBe2z1LbWZZN45ntzWLNmvK+WuLXHXl8TMPEmuqJzMnP/RqEJc3SSwVkLOEKN0zHXXaZp7zmyHueB9cG9dkr/9qBdbbVWAvGGVODTiidSIsGbAQd+26uAjEk6BAuUJgL2pb8L0ncc12rB6NO3+X/UvACKmOYf5tnsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758121362; c=relaxed/simple;
	bh=ETwcmm8JSn0BgJbSlKE3RKnZqCQXSERLDynaqBiXOuw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=k0NOJWuAxXvlWbanxtt0AmfgENhuSQfEnChJgsrJ86ZIWh/ONZJKu0ptq549uEKBi8tk0bNihFuNJ2zGgz7nBTAVNEWs/nE811xGVZuQzRrO6OKrndUgOQ3KOsYZXb6sNuhq7JOrm85al3E0Xvrf7E8yTKQMAS1deyUxemvka4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=blDTTlyN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="blDTTlyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758121360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=YYhCdI4Q9hUzoKgBgYNuwcWvhIZyQUxhaAtXakv2Ac0=;
	b=blDTTlyNlUxbMENrvHb6X3XzzDTvfrtfAw32cXjuJifA7hjLi+fdKuHz99GjO6QZAg8VBO
	urUVZpzjrTfwi1BIxGLrGN+WhOzS2KYKleSyP9SPC9WW8GEkqht2S0I5ZXDVUB/C1/diYU
	ufZQeCH/mS+siGGGxZEP/0wZeL4qUmI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-C9JezTSqNq6tuqFFFDj-Sw-1; Wed, 17 Sep 2025 11:02:39 -0400
X-MC-Unique: C9JezTSqNq6tuqFFFDj-Sw-1
X-Mimecast-MFC-AGG-ID: C9JezTSqNq6tuqFFFDj-Sw_1758121357
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45e037fd142so56562745e9.3
        for <linux-coco@lists.linux.dev>; Wed, 17 Sep 2025 08:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121356; x=1758726156;
        h=content-transfer-encoding:autocrypt:subject:to:content-language
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYhCdI4Q9hUzoKgBgYNuwcWvhIZyQUxhaAtXakv2Ac0=;
        b=AA6vqX98EHGX56QjtM+EPOEu4hveD1Hu987TqNV7QCHRQmZQB+RJ5gY7Y+eqNivO90
         zdoJ0qLVu9bPiz7yN6Ukmj/1mp4sVvHauc/V5Qki9rOVgeAmiu5m2jC6rTMHttTFWreo
         JdYbD+vhwAxoe6QVd9fn30c5jAxfRnp/bNDhK7GQuayU6S9WqWtj8knnieDBsbmtQ9dJ
         C5FrLKP1/0JW533oSKl/jkRHz0couPiCZSxZpKbpUPLOQshn+/zu0NwNQtPc3gfVP1VL
         MAUmq3QBh68Zk7/u0I/5rhZJeoZZAn1sfTk/VG08tkALOhd3tuxyRmOvl5Yb6gtnBGih
         Xq8Q==
X-Gm-Message-State: AOJu0YyMTjvF3p2lRIzN3y7ht0EYex6SU6ligQzuT9lJFo7OxWe3p4mM
	rHtdSPiwa3jG+ifJytJNlL7SJbXT4qRYpTMppoHzElnavXVaunW5PQ4tm4VmNQxfXDhNjTZDzGP
	wn1Eq4RzTKKZk/WOQUIqAIca7NGQtjBNMPT2j7w/vATzitRm8nYVPcN1GW65/ztcmzsJf1Vz7f7
	WgUTf/s4fEGzf8WPSNjR/M3fmltO8ecyzExKgfgaziMChga5LQ
X-Gm-Gg: ASbGncvJeGL1d1xfxQeeNzAH9WTyK+ecXxtyD+RvENdFTtxYj7ykN6XYn3qiSqpbhCp
	Yv15dsK3aHAmeRE49LVR30i3Kct8zUBxl1h9/oK4fiimOmZ/yGHJ1n9tEfChjjylQmkRpZmsX8x
	jsRcZNCfhl0ON1MKdk6xQjjY71G3/JGYuN7A/SztYyqPzAEMfLe6fqaFyVX5LikoIfaBiIX1Zrj
	xfzvzjNLwgR3gaTz0PLC4WMIicUC0nGw1dtdPSrCcKUiMiS+4P19ESoUw+8r3wBlCw2HVHELSoL
	MsabyQSaBbKs9wgc5r8szyQlbI0PCKbyaNvm3jioiSl/DZfVRUf4+edL4Htr7UjEod5g2coWMwj
	1bJPr/HfRismFcTsj/LNL6g+xLEmY32SVGKEllniD84FNAtPSa0tFoRof9p+ewN7E
X-Received: by 2002:a05:600c:4f03:b0:45f:bef7:670b with SMTP id 5b1f17b1804b1-463699748c5mr11533585e9.3.1758121356287;
        Wed, 17 Sep 2025 08:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENQagQHTk2oT9ysMwgYVh+So5rsFAoYrcTyucKX1OXr6gl3RPWUZl+VDYfCpD1fI5KhTXxfw==
X-Received: by 2002:a05:600c:4f03:b0:45f:bef7:670b with SMTP id 5b1f17b1804b1-463699748c5mr11531555e9.3.1758121353883;
        Wed, 17 Sep 2025 08:02:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e98b439442sm15671180f8f.38.2025.09.17.08.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:02:32 -0700 (PDT)
Message-ID: <46bc189b-911e-4dfe-bafa-43ffb9200427@redhat.com>
Date: Wed, 17 Sep 2025 17:02:31 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, KVM <kvm@vger.kernel.org>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-09-18
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pzhyUpV8nnQEWvOPJr1JKJQBG-whOeToAjAyo70OOb8_1758121357
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

Our next guest_memfd upstream call is scheduled for tomorrow, Thursday,
2025-09-18 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

I suspect that we will talk about

(1) direct-map-removal support (folio_free callback making our life
     harder than it should :) )

(2) the future of preparedness tracking

(3) discussions around "stage 2" and whatever comes after that

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

--
Cheers,

David



