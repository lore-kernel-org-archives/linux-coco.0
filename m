Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEEB201017
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089551; cv=none; b=DbEzuF5qc/6sC2oFiX9YX2g9KUtv/ltnoYo8ouY3bi0Kf7XSZmv6oR1zTAELf2xom9oR09btntppxyiMdc+adbTekneHpch+pa8SCSuDC0Qc3U7GK4vIYdn3ZduR3SeQYUljDmI/2uwe7XQAWbDnFBlPXZLtjR/ftq0dCCwE0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089551; c=relaxed/simple;
	bh=L0yZI1Kq77rzCbf+eJXPv1Z37F2/dQQ/oBiMcvhkljU=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=TsujUGOY1xT6wWT2mh23jWxFxGHTYJ7pvc975Wna4INkPcou2lNEkBWezLqrORRa4qFeFiTpTDE3ELE2tUCYpPcpf0MjHDiq+TVM68AqgRG4ZKCq0GDnESzBSj1m8yDDcGVi/F5C4UvAZEPYYFcnyX0X/TjdM5fQqMeFJLPtP4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IncvpELw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IncvpELw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741089548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=p5vMcH1m85r4ZyF4VX5xnFddJDrUGh6ySD+hcMeUnC4=;
	b=IncvpELwwBHXlMmWIkLhY4+4GTAshnY2IMkjOvEvmQb+hNq1r1TQDRzMl2kaxgRWlG5GFY
	qL525LbjJToHLWKDlOd6GPFPSrLH+xHsa/kzimBdHkVWqbgbvvnvQW05HMLjmCxTu9wYcP
	OkshT+03QWyVat5Qj2NIwG2iyHnWcYs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-IDFx0btbNNuvUUQqKzYt6Q-1; Tue, 04 Mar 2025 06:59:02 -0500
X-MC-Unique: IDFx0btbNNuvUUQqKzYt6Q-1
X-Mimecast-MFC-AGG-ID: IDFx0btbNNuvUUQqKzYt6Q_1741089541
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43bcddbe698so1943805e9.3
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 03:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089541; x=1741694341;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5vMcH1m85r4ZyF4VX5xnFddJDrUGh6ySD+hcMeUnC4=;
        b=xOB+gsaFBlkUZDWu04y3CLgks/p1cZ3nGVGl89yPztNN5hhUhE1ja+HHrWUrT23EUu
         xSE0CCu0Kwoq6F9nQcDUjgvp7hipQuDfoLZHG2BWAudw4tnhDbfib+EmX/qVsG7T2iT6
         0PwzUMsPLRlMf2g0sEAruwR9DT61Pgp9J/6kX2O8wv3vDxoOplHTacp+UG60w3Im83Tj
         tEoyLZk4yQw9B/SKTVOQNblayAYR82vlc2xqOHONw66chHF3m7HhUlvznjJ5KlpnqeeQ
         8K7IsK6CeoeEQJwp6caM77Qep85QKOFoTuPf/wzCz24UuhN2iRMoDP7GUt2WK/GngqHz
         VplA==
X-Gm-Message-State: AOJu0Yycn4ttNPDKcrwwEdi12Lz4NPKNlmLbkqMA6c26bhVveFEbxYNN
	c2uCOBZQonbKrTH54FjcNUVxtkVi7c3GFQgTmyldehnR2G/MJhdo/83X/5nPIuZEwp3yfrTkU/B
	d5Hvy/DcoYIK8zAkKqGwLnDUtpt9N52da4ivpuZTTsrRpyuwvUp51geTs+aW92nhacykRhsemAz
	8RM5w2Z5d1Bt+dq69JvgKcpfhUXh9LTNtp5ZnMboGoLd37
X-Gm-Gg: ASbGncusqp1tYtvv+gFDerNGkJdU0kmmojozkHKVDdUG45IHD79jYJ3n2G3ssSh+qk5
	vd/csgSrabp60jV0NyH3qfi/19YI/4GjHGtJNGD7tlfps/cTlZsBwLX8hLvEXrqYE61TBYM8m4G
	KnK6qu5iFtydx0LLXf+vlwre/AancaSjNKa3EOpunUf1fV0dnXal2g1lwZ0vTLL4k887aeCqTei
	4sZT5FQrIetiywnz2A89dZgI2poAqnmG4D6Xc0h4m0jcUH8uNMk2KPpBSxuU9DTHFK8izS6PkCk
	PS5FxloEh6Jn3rAoDbrOxOyTLWdwwoqYL3KMFjVKsBYTUJ5LYLw4Q2YIxnZlPHfJfh1CGkUwvtj
	QnF/0N7vC2x5kY1zIq/Oa+MVNt+VsOM4S3wEQebY2kVA=
X-Received: by 2002:a05:600c:a01:b0:434:f131:1e64 with SMTP id 5b1f17b1804b1-43ba66e6c78mr131423545e9.9.1741089540910;
        Tue, 04 Mar 2025 03:59:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu0t40JlGkFkz4HQS+HBzdnYvZ/WPD+O3bqAfzkChgxRu3omrc/htkDz6Y3BmgBxEUv9IVFA==
X-Received: by 2002:a05:600c:a01:b0:434:f131:1e64 with SMTP id 5b1f17b1804b1-43ba66e6c78mr131422875e9.9.1741089540291;
        Tue, 04 Mar 2025 03:59:00 -0800 (PST)
Received: from ?IPV6:2003:cb:c736:1000:9e30:2a8a:cd3d:419c? (p200300cbc73610009e302a8acd3d419c.dip0.t-ipconnect.de. [2003:cb:c736:1000:9e30:2a8a:cd3d:419c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc1b5db02sm71945065e9.19.2025.03.04.03.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 03:58:59 -0800 (PST)
Message-ID: <4e1aa924-f463-41af-bf2f-ab68f143239b@redhat.com>
Date: Tue, 4 Mar 2025 12:58:57 +0100
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
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-03-06
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r_BfT5cC6qm2r-MfMosZenErOpOoOvZuWy7gNPd6ggs_1741089541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

our next guest_memfd upstream call is scheduled for Thursday,
2025-03-06 at 8:00 - 9:00am (GMT-08:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

In this meeting, we'll focus on:
  * guest_memfd without struct pages

... and talk about some of the latest upstream proposals.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

-- 
Cheers,

David / dhildenb

