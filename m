Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C02139A6
	for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739437958; cv=none; b=Hvc0tOmGakOOeIHwPe9WlnTcQD98YgJsWzNRreu0NUV8YrVqw5u9sOimCqO33A7oebEjfOs5GcCwL9zisV8i1YvPmnmOji9UXU5vOhZCOLgpOAdSTsCzFVLpGuyo8WtYm3+i06P+tZsJnlqu0jzE0FQD+EwvYaBb8EmeuRPYkOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739437958; c=relaxed/simple;
	bh=Hpd6cn3Os/G9hehs6bXs/er3EDTTNqwu3Jq9nyiomNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSKkOk2hpHqK/gC1zOeTvAMrhym9w58SgV+ueLZyM1vUebnLcdn5bMoAsqaqfRMkBPs7rwJ5vXo+fUSkhtLDBs2SlUmcxkt7J+W9B6FzNZRl5VvpKfLA8HuD9Lgz/Dtk5vJsM9c5AwS5liMuuV0Xqh030RyXY7yAH2UvQOMQOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YUCorjsv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YUCorjsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739437955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hpd6cn3Os/G9hehs6bXs/er3EDTTNqwu3Jq9nyiomNw=;
	b=YUCorjsvTjh2amAbYkAiKmFm6if1PiQvSJ15Ut5zecAULfBtPY6oAfIO+UoW29dHx1gngj
	m87yylJcTNMJTs41vzY5naI0aQnOycDSCyKn2CkF6CwlMGxYV4Bn+pQHxCmhZf5/YJMBH0
	G0ewE0ezsepgplrykEPQPlT8jwWz/7s=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-o11Mw_FbMgy3tfDfWdwO6A-1; Thu, 13 Feb 2025 04:12:34 -0500
X-MC-Unique: o11Mw_FbMgy3tfDfWdwO6A-1
X-Mimecast-MFC-AGG-ID: o11Mw_FbMgy3tfDfWdwO6A
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6f3ff1ff13aso9822347b3.3
        for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 01:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437953; x=1740042753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hpd6cn3Os/G9hehs6bXs/er3EDTTNqwu3Jq9nyiomNw=;
        b=R7waVnsxJNcijf4ViXjD/22cmj2xNnaemTLKaeogiKy0/RUPly9vUgcAxxRXD5OLkA
         LJIMNSMYd4pjH+YSv7xn9UQfeGJW6+TEMpXR1PWRkg2Ok1lYrJe7kwaj1Cc8beqzBJ1K
         Tp3gRdfKxX23+04RbFlu0vK/ugouWuooFIFc2cSx+DABaSqwEp4e/BPafVFW47rgY5ob
         mzdWrwgjn8aHQNq5itCEBfIAYzbPpncmVeAnob/gWCGH3SLiteFVWMvN66YugSvGVKTG
         PpabOGtDvgO9oi9FO9m9OExNmWnt1tDE1jv8TT499QuOf9cg0h2myR2FZhYhIiHRLU7e
         eb/w==
X-Gm-Message-State: AOJu0YybQjTZ3gBKle3qMtSqsYetp18NfnXIpT9P1GBG5VWJZcelb1hY
	7YBS+xpSnalGbHhZ1FL/shvq+ZKLz4UfTYyscucXtB6Uil+2juOySu2XPGj0EdCroxlf6ZBXIiN
	nwD8NJV2fmtHAOFEHuBtyz2EqVokERe61QG3NA5hWaBnaeL5YGQZDbbzrAXBCHMsuHvpKfbxSo6
	s5+C6FtSFm0NYcbo9C5I7634G9zx4OvfkjSUDzx4yvEp4W
X-Gm-Gg: ASbGncsLIBa/rF9w/E1yVV19+BvYrfxOr/JJLzZPkQ9MNkyr7afbHvk+OUpWCWbUNQw
	ZKiZO36DH4svXeqHr1Q3RKGlnBtZKDhZ/AQTmv95PIaZjwDhS9OSynl1pNIbX
X-Received: by 2002:a05:690c:3685:b0:6fb:2980:b0bd with SMTP id 00721157ae682-6fb32c6ea8cmr22936507b3.11.1739437953248;
        Thu, 13 Feb 2025 01:12:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4rmJbP6LWTve17VR4BujQvoFXTr5BQzYFcbCLPZh+kz+v1KFCdFq4lCvdqi15dnnjKuDJHugladVEdU3yPKI=
X-Received: by 2002:a05:690c:3685:b0:6fb:2980:b0bd with SMTP id
 00721157ae682-6fb32c6ea8cmr22936337b3.11.1739437952887; Thu, 13 Feb 2025
 01:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z4k5C2bw8El7Yn9S@suse.de>
In-Reply-To: <Z4k5C2bw8El7Yn9S@suse.de>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 13 Feb 2025 10:12:21 +0100
X-Gm-Features: AWEUYZmvBvMpX0Tj_huxms6z56RMr0PjbLrlk-wd4bKZ1ti48RoeCaTJs8FjJZY
Message-ID: <CAGxU2F5cU7CggPK0e9bnu1=r4mCaOry3cY4tG2FBdBuQw00uqg@mail.gmail.com>
Subject: Re: [svsm-devel] Confidential Computing MC-like workshop in May?
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, 
	amd-sev-snp@lists.suse.com, mathieu.poirier@linaro.org, 
	Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>, leonardo.garcia@linaro.org, 
	thomas.fossati@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ivkyVHA-cdYQaq--tb7QfX5BufxBSbmdEUm8HVoLcaQ_1739437954
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rg,

On Thu, 16 Jan 2025 at 17:51, J=C3=B6rg R=C3=B6del <jroedel@suse.de> wrote:
>
> Hello everyone,
>
> I hope you had a great start into 2025 and return refreshed for more
> exciting confidential computing work :)
>
> Our last get-together as the confidential computing community was in
> September last year and this years LPC is far away in December. So there
> is the idea to have another in-person/hybrid event earlier in May,
> alongside Linaro Connect 2025 (May 14th-16th, 2025) in Lisbon.
>
> Lorenzo (on Cc) reached out to ask if there is interest and enough
> expected attendace at such an event? I personally see quite some value
> in another in-person event before December.
>
> Please let us know what you think and whether you would attend such an
> event, either in-person or remotely.

I'm not sure if I can attend Linaro Connect in person this year, but
for sure I can do remotely.

Another option might be, like 2 years ago, to take advantage of the
KVM Forum where many of us attend.
It was announced a few weeks ago that the next KVM Forum will be in
Milan (Italy) on September 4 and 5 [1], so that could be another
opportunity.

Of course, one does not exclude the other ;-)

Thanks,
Stefano

[1] https://lore.kernel.org/all/ea6e5059-85d1-4503-99d4-635272b9b32b@linux.=
ibm.com/

