Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC16D37F8AF
	for <linux-coco@lists.linux.dev>; Wed,  8 Jul 2026 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518526; cv=none; b=DC/57Qd7ffeSS3MLeLfdlL4OGrb7r3d8LZ7E4VhabgKQT4fdIblcccCCR8RC/sGptzpHXuZcgNyEcXHZSwnuNdUh6oSicqmh8oIPiKHSmD/clkdz4ILcl3uNc/cmPgndbF4F+Hke47kf8raI1/0GvcgH4buDsYX8vSDI61e9Wuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518526; c=relaxed/simple;
	bh=HRpbfYi94SgnlAPxJxXtY8AqbVnyCTReGeanHcSFrmI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=p6R258jC2lW6bSyRcgEPNEw2ZSx4rJq543yJCCrh5RTTtdF6/I8QzlZsW5CRTT6ieUoIqcSqsXzz9j+ii/WCMPk9gofrjO2wm5YjcaXe2lz241p8nSd6hJer2/jc3TnRJW1VOnU55PGwsJs1WO455IGGJjcqHqWPdywvJ25mI1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMHS6PSF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMHS6PSF"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aebf120839so898223e87.0
        for <linux-coco@lists.linux.dev>; Wed, 08 Jul 2026 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518523; x=1784123323; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J+0mdBAgPT5Lu8N0Tz9pyH/A6lc2i4NyL8yHI0E97ZM=;
        b=dMHS6PSFSz6uDyPRi1Rp2OVBGZlFaHs+ZAHPGnQy7sZIFshxO38MvpsqJnjJaxpHBf
         oOlBhW0L2IxcJoPWvdpY896bBc7RkX7SCQb36/h43QV4dmOV8BHbh0PuKdtteDtNWiQ7
         iODiKvjt130LuoIptW4XlDGcRqFWXTAN27QLcY5W0/wNDK4s8R5vkE46rfJc8X/6ct5v
         KrCeAzrF5MGI5d9clTlnlH2WBnV4jA2GC+FpthOmXF5I7dVn89BP0b97/ZemVSRP0kSn
         VoAfiD7zMfOKg/e5uVOGfc1BaRuE2RNeKHrkxu1X2ZU5JaK0eHs1OmyKszAi67n5gQsT
         EdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518523; x=1784123323;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J+0mdBAgPT5Lu8N0Tz9pyH/A6lc2i4NyL8yHI0E97ZM=;
        b=oQhYq8tEPSWEr8kLETjJD3rFqV6m1nwO7fpwIuYZfzRBEeNauDUIqXcqGQrEMzxt6g
         KUUf97dahv79gWaSoiPIHy+xxle8HVJXhSH9Zixy2wdvDRmPtCPBlW+/XQwJ9nFoWAVL
         PbHbWnzvVlqeitqly4MBEAJF0RfaoWjEp6hAwrLSmPY6eQqRYEUmSWk7zgJXgZ8Pn94X
         Fo9THnLsAEX5WLJXpZyIf7/i5hMSJvWu6vENGTHtwrT0DB6HWhDkuEwZ5uruseTUztDf
         o/acqXM6ABOK/IJd5NmFJbbheubqhWIOq7l6uErAh9hUk2uqhFHWVL+7iP+EjepdnJgN
         xSwg==
X-Gm-Message-State: AOJu0YyUO/NUTdlLeIYVre6rcSX6qJqYyMFudK4omsOHjRqMyPHrNUoD
	z51j5BipZqCln30I0BmUqXW8JlrF0dfdNz9LGloIh/x+RncKNr8sJEdV
X-Gm-Gg: AfdE7ckMR3/ue+5QfXY8arprO7dLqq+XbH2WG1rUSUXJvzxu+PcuVby0TZTUouF3fIp
	uDYZwj3k01NVKcrheOFbV0msxI9MAK2UD7fOO7e6SUOsFzW52sXMBAfYWMT05Qsv+ZMF5yURCYR
	6u+/yQ9c1ADODQlkXwfDtowRi8ak6AoTmx7YV83j50bLtW0xY9VnP0V7ioBKmP3HPQ0Z1NuD/u0
	+jUPWSsQFaPufP3QAI9hCTXN7xnCLZfNmph1NqUE2eyli+nVMzgY7Gg+4B6b8RJXuxDAxgpq7hH
	QBm5wd+woFC+3N0v/7+SXOd8/+x/MPn/pDXNAs/F1WY5dZwKsokvgMWSg6VPopwEiJxv1XRnC+A
	G6cOJeqeS3DR+6wMeDDQNc5F6CfxOmUZ9J1ucoY+BfMHJZlp4gFLxsB+8/5d8ZJ35F52CAQDjjJ
	qAHCUAhyDtExJzR6JpcIpI9ffrbZmIqA==
X-Received: by 2002:a05:6512:1417:b0:5ae:b4bc:9109 with SMTP id 2adb3069b0e04-5b011492e79mr609428e87.10.1783518522775;
        Wed, 08 Jul 2026 06:48:42 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:eccc:7ea2:9458:892d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8b0sm4522878e87.4.2026.07.08.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:48:42 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev,  linux-pci@vger.kernel.org,
  driver-core@lists.linux.dev,  ankita@nvidia.com,  Alistair Francis
 <alistair.francis@wdc.com>,  Lukas Wunner <lukas@wunner.de>,  Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 01/15] netlink: specs: Introduce multi-message blobs for
 SPDM
In-Reply-To: <20260705220819.2472765-2-djbw@kernel.org>
Date: Wed, 08 Jul 2026 14:23:42 +0100
Message-ID: <m2pl0xboo1.fsf@gmail.com>
References: <20260705220819.2472765-1-djbw@kernel.org>
	<20260705220819.2472765-2-djbw@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dan Williams <djbw@kernel.org> writes:

> diff --git a/Documentation/netlink/genetlink.yaml b/Documentation/netlink/genetlink.yaml
> index d3f3f3399ddf..4caee7d55303 100644
> --- a/Documentation/netlink/genetlink.yaml
> +++ b/Documentation/netlink/genetlink.yaml
> @@ -153,6 +153,13 @@ properties:
>                  enum: [ little-endian, big-endian ]
>                multi-attr:
>                  type: boolean
> +              bloblen:
> +                description: |
> +                  Marks this attribute as a variable-length blob that may be split across
> +                  multiple messages. The value names a separate scalar attribute that carries
> +                  the total blob length, and which is sent ahead of the blob data so a consumer
> +                  can preallocate the full payload.
> +                type: string
>                nested-attributes:
>                  description: Name of the space (sub-space) used inside the attribute.
>                  type: string

Can you add a schema constraint so that bloblen allowed only when
multi-attr == true and type == binary
