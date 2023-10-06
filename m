Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D44C157
	for <linux-coco@lists.linux.dev>; Fri,  6 Oct 2023 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5haG04/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696601896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1fHANI4y2LnpbnYU8tB9BVrhts43Vwe9t+yNXkQOOo=;
	b=H5haG04/TqcWl4jscPItdAhZVkOKUD+BKTJC0LRDyTLAoxTJMsIZCQma/TKQkCyJ1psTvM
	towFNNXGZnnoImLP4hCam1iK/ylpTSfkUOAJ4tD/ApFnybN3L364xHcR4EcgAZN6uD7/Da
	9HUk6n8QCb1ERkLZpbd1W6ASumPUREg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-pZlCy7QvOL6WRKhYt-sv-g-1; Fri, 06 Oct 2023 10:18:15 -0400
X-MC-Unique: pZlCy7QvOL6WRKhYt-sv-g-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-d8153284d6eso3021907276.3
        for <linux-coco@lists.linux.dev>; Fri, 06 Oct 2023 07:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696601895; x=1697206695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1fHANI4y2LnpbnYU8tB9BVrhts43Vwe9t+yNXkQOOo=;
        b=ACpZ9DXUorKXFpXsgrQY28F6pCd5FgMQE+wJLIe4Infx1J3G3K1Wj5y6WGY7QORZ84
         13G/OMi346pahhLbvIH69hceza3UipDLI6ew8YerDnUIrnfTn6ZKzVITSereUMTi2sb/
         lWo9J9NahcEfskiouNH3cySc4AKTi8OdmkKwOl6tVaPGHV3qP1oRqftNDHC3NOZhere8
         A/ky2Q72/2lpjRn4uEQvGApHSq2GZu2ux8TrFS3X9GE3jfdgIlMXg1WTfhKfy3RRzy2h
         rYWWlIywzxsCvjRHN9PrB48aik9ykMSN7opcY/pNYJQlWAbsJ+zSlhs52/zoNOPqXdrk
         Ychw==
X-Gm-Message-State: AOJu0Yw0MKhfvEm3bAc+rU09z2ByxA/6aOPxRDRjS9fu+aO0wgrC67go
	WzETwRh472u0GwkdFTP5gSUilSL5U0ghSTegsdkXSeKCOTPtDQPzx6MiJxH0SftJVHBmJ6E5JXR
	FO12Yi41IHOD3KyyKYp8IKiuu84/7cNUSCajbgQ==
X-Received: by 2002:a25:3485:0:b0:d7b:95d2:6d68 with SMTP id b127-20020a253485000000b00d7b95d26d68mr7241704yba.29.1696601894747;
        Fri, 06 Oct 2023 07:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7uUwYtSAE/rdMws61NcuvXjUsiyZqiCYXOP5jd+VA7pfYCA+IKD0zYs3Fmc5RFCWuktHYaT0lhL0u+xFquwM=
X-Received: by 2002:a25:3485:0:b0:d7b:95d2:6d68 with SMTP id
 b127-20020a253485000000b00d7b95d26d68mr7241689yba.29.1696601894421; Fri, 06
 Oct 2023 07:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c677020f-5c98-ccdc-b204-bfaf5cde02e6@amd.com>
In-Reply-To: <c677020f-5c98-ccdc-b204-bfaf5cde02e6@amd.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 6 Oct 2023 16:18:02 +0200
Message-ID: <CAGxU2F7kuTrrqWgwF9aVJKSZgn_fvyj4bjW2D_mgdfVssPmLYQ@mail.gmail.com>
Subject: Re: SVSM v1.00 and GHCB v2.03 specifications available
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tom,

On Wed, Oct 4, 2023 at 7:30=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.co=
m> wrote:
>
> The new versions of the subject specifications are now available. The
> https://www.amd.com/sev webpage will be updated shortly with the new
> links.
>
> In the mean time...
>
> The v1.00 SVSM specification is available here:
>
>    https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/s=
pecifications/58019.pdf

I think there's a little typo on page 30, section 7.2
SVSM_ATTEST_SINGLE_SERVICE Call.
RCX Description: "gPA of the attestation services operation structure, see
Table 11: Attest Services Operation"
^
this should be "Table 13: Attest Single Service Operation", right?

Thanks,
Stefano

>
> the v2.03 GHCB specification that adds support needed for running an
> SVSM is available here:
>
>    https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/s=
pecifications/56421.pdf
>
> Thanks,
> Tom
>

