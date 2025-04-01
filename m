Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7FF20C48A
	for <linux-coco@lists.linux.dev>; Tue,  1 Apr 2025 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540929; cv=none; b=eRSufI1+Wq1ZYdK4fWCPSA76HjqIs6UClLJV5/z5j8Dm8EAIIcrnIjdXBwKsq15wq0grTu8INqTjzNCSHEJ7IzTGVYDw4tpoYaG9Q8R5k2GArfkrTylQ3CMiRE+jDM/T5bCMs/5oDdqycGV8ZDBTMy8c8D29FvLSwhchD+g0vX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540929; c=relaxed/simple;
	bh=wO5tHIDlxst7r697iR4bshoY56C5LbRa0jXC0tZViGM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=lllu5por2vEHRFYynhQUEnONzBdftS627vBYoQ7cOA0TI/4gcJC5R7xjGDn/gP8X2P1p6vPRvv10EHmbnByPVm46EqbSkzI+VHfnoGIJdvCh1CgRxjFofc8NfdbEhjYxPK4RQ6WTexlif5o7P7jIEvknMrUT4H9kjAzBrzM+uDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CRWpJg6b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CRWpJg6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743540927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7QpsIRYDdD+NL12KBYzmELgBny35dGaEVH3KooFWSIs=;
	b=CRWpJg6boK5lXUMhCcSNYQ1aPLJdPKX2P/XsHOaclbO18OlZxdHqISvWQstwO8ZAs5tnYd
	bk4M5WHRK4UoRc1JP70Y8Zmcxq0sYL6AllVqawt3YHm3dIViVOYq/15CSpDE1qZUTRqUvA
	bBY3dst/kLgdn7XYpCURyzdcUClV2Ng=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-I8s7lPy8Mvme0yCMBN8PCg-1; Tue, 01 Apr 2025 16:55:26 -0400
X-MC-Unique: I8s7lPy8Mvme0yCMBN8PCg-1
X-Mimecast-MFC-AGG-ID: I8s7lPy8Mvme0yCMBN8PCg_1743540925
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39135d31ca4so101088f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 01 Apr 2025 13:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540925; x=1744145725;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QpsIRYDdD+NL12KBYzmELgBny35dGaEVH3KooFWSIs=;
        b=ron5E+L8nyQwUl4uNTTboqLrVFtNJCJyQKU+W4lXvcDbeuRvPYZFQsdDjUJPc/qnhp
         HZ+auzmaMgiSOs5zx2DN135qK6CH4LMkWkN9SR/EH9bI4v6BJgNyS8oCLsfYkuhuo+XF
         Hxn3o/yNYI+EdGAaTXWfBj6wWKVIjIR8C0HR0YZDprnOYGVvFZ04cZrjxclG2qfRgBR2
         A7Fa0vRTuEnSU60FRkOSae5403RA9iODbnJiXc/U1+LTm7kBWntCfsXoZifQdXis7N4J
         blGQrabBoQeW1vT5HJvsUOBGnG6YKjPIJom+zh4lSh66SJyVHgj9w6IbHx7UVcAkSIwd
         Ej8w==
X-Gm-Message-State: AOJu0YwwRsB8xacpvKo7azqcrThFJImS2stp67u9ezb7CquPdWYwZCNF
	iBRD/aIo8TvumnenmkIkaIUmInNThnEGwiCOZVXxJxeycYsNHPS87Ykjm8oQJrEwBrQIgGRqgQZ
	hXkRhI1/vUX/OzCHG4mfvNLBKhdU2zLcovjsll8HFNlrBjmnfS5Ktp3CyVqBhZT+QKS/hYUNwVR
	AXsbPx/7anRdrmAikthKEoe2vBSkPKcfPcsOYrSW/S1ay3
X-Gm-Gg: ASbGnctLVMu9P1q35X+X4O3+bA8STgNOz0HG3FDlv13hhAkUvoSV6CtBV+0eeKfwEpf
	od+whxJgN9voj97zqmS1DE3OJkqsmWOjGsIwWRHNs9pr5r38kgCmBafxAhqowHKzLM9sN2JIkIt
	03AxSE0DFHqlld680uIyFyX8QIB7tozqnHl9JoUaRTtivAn5C4cWaa3Xtve3iDTS8GhhENPI1Ji
	WG58yr/9SfSPDsXmGVyZiN5dtzpFhTSJ825URA0mcA4rbcHtf/CFXObHQJBi+yrUIbagmr+N+Zt
	GowqTpf3t8LkyvVCth4criyHiUrc53LeVd5etL5sjcGP2Q==
X-Received: by 2002:a05:6000:4283:b0:391:952:c74a with SMTP id ffacd0b85a97d-39c27ee60b5mr1307686f8f.8.1743540925185;
        Tue, 01 Apr 2025 13:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY9ekMJ4Nar5uiVtoOHkCFgzdpp/cgUqXG8VhQGEL+yuCge44cRIeUThbv+Mn70edoSI8jmg==
X-Received: by 2002:a05:6000:4283:b0:391:952:c74a with SMTP id ffacd0b85a97d-39c27ee60b5mr1307647f8f.8.1743540924756;
        Tue, 01 Apr 2025 13:55:24 -0700 (PDT)
Received: from [192.168.3.141] (p4ff236cf.dip0.t-ipconnect.de. [79.242.54.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d16049sm22202225e9.0.2025.04.01.13.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 13:55:23 -0700 (PDT)
Message-ID: <6c9362f3-0eb8-4526-a7d3-3d483a40dd84@redhat.com>
Date: Tue, 1 Apr 2025 22:55:21 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Invitation] bi-weekly guest_memfd upstream call on 2025-04-03
From: David Hildenbrand <david@redhat.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, KVM <kvm@vger.kernel.org>
References: <7b3090fb-1816-4761-a7a5-17d49a050645@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7b3090fb-1816-4761-a7a5-17d49a050645@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k0E1TQTH2AIv5HfEhtYtypmvp7-YYq5GBeaIU7ejc5s_1743540925
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.04.25 20:46, David Hildenbrand wrote:
> Hi everybody,
> 
> our next guest_memfd upstream call is scheduled for Thursday,
> 2025-04-03 at 8:00 - 9:00am (GMT-08:00) Pacific Time - Vancouver.

Correction (thanks James!)

	8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

is the real deal according to google calendar.

-- 
Cheers,

David / dhildenb

