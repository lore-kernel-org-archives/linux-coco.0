Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C8A94F
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 19:40:39 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id n12so13488253pjp.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 11:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t+UmBH0KEMkJepkYdqkigy2UrlidbCnQZPnXeZKJo3A=;
        b=OSr2NS20QNgKsT/P4lZDXmQ6Tp80EYCqblk1eStaTuIjgndWv1uvphy6962z1U9y+k
         1otIwOjF4yBFsRSw8836cRS9d9mR2nltQQupoucB+f6d8ClzBd0usGePcoNvrp4Rf7kZ
         nODfLGg39G0NYZvjUaOC4O4lIBsEV2DJcYh0cr3ffLUkZfiDZnDTqRZjGIQ0nVt8/7X2
         QPML0RMEiqXUt0sJsQQWVPSh2ECLf6AWdK3oL+Es2lgJetAGXfd65O6beegCeqxDW30j
         d0lW3yEuPKv2cQE3qFALiqz3uQDRQfEIzR1UgWqRpk6sRGOLkxfmO+bcK+lyuz7pc4OF
         QJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+UmBH0KEMkJepkYdqkigy2UrlidbCnQZPnXeZKJo3A=;
        b=dbeJBwMSg2TLBUZ3rGmzL2OjddzdAWQuDZy7BFA8yxESOHrfYmObWRHPvmJ0KrC2N/
         Fcr2kBRxl7328CZaz3SXJi6RiT0JTf1+SrsqbANYjh86eBtS1aqe+PAAGBo2s+MfkhhH
         mYp+7llGlzZd0n7knRDhrX/HUoeYlAeSFHH9dhBONS+g4l2tkOPnSK/QOm6hIoivT4mB
         w4/7CkRvAsuBgoSimSh6tZdh6hn5Y0LXsangC8tJHbzYKTJNhUop/mIhJIaeKNs25OY4
         jHXtwn9WRzwJ1pj0sVoG+X63GOtCVJHf6x/nB1SmEPe8mhVVAFAMVq0c9R3OlY7PRikd
         0DSA==
X-Gm-Message-State: AFqh2kpyJRuBZnVrvTyKbyNMezClvepabOBak+e78g0K3kwI452e4QId
	5cvIAV0xFixOq23dYswjeOYxgrvNjvX///JIteU59A==
X-Google-Smtp-Source: AMrXdXvIKd8QptB8bXGhFMIeyLtl1P+xk2tSdIMMYOexAkX6tNFyGi3z9kpkINahVkUyP8YVLwjuK5TlGVLnej10bhg=
X-Received: by 2002:a17:90a:5296:b0:226:eb2d:c7d4 with SMTP id
 w22-20020a17090a529600b00226eb2dc7d4mr1281154pjh.106.1673379639313; Tue, 10
 Jan 2023 11:40:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
In-Reply-To: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 10 Jan 2023 11:40:27 -0800
Message-ID: <CAAH4kHa_DN2e4DreB_PfUEsu7KrB64=m5=-HnH+WpnmecoRz3g@mail.gmail.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Content-Type: text/plain; charset="UTF-8"

typo: "oridnal"

For the statement "Locality usage for the vTPM is not currently
defined." should this be interpreted as version 1 of the vTPM protocol
will not support locality, or simply that version 1 might have the
affordance to add behavior for non-zero locality in a future revision
of version 1, such that the result is not specified as
SVSM_ERR_INVALID_PARAMETER? I think the latter is probably a dangerous
interpretation unless v0.60 of this document is strictly considered
"unstable" and shouldn't be used upstream, so I'd recommend clarifying
that "currently" in a document that might later be outdated should be
precise about its specified behavior in a versioned fashion.

On Tue, Jan 10, 2023 at 10:54 AM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> Attached is an updated draft version of the SVSM specification with added
> support for an attestation protocol and a vTPM protocol as well as other
> miscellaneous changes (all identified by change bar). Please take a look
> and reply with any feedback you may have.
>
> Thanks,
> Tom



-- 
-Dionna Glaze, PhD (she/her)
