Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD1E13E88A
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822866; cv=none; b=NcG5U/PVyhUq+tLahOW7IBAywaxSNexhB3eiLg4mKJkXkdsI09E1kRXWodj/JAe1q8CCBV0I5EFLFTr9Bxzxfdnf3KGUsxOnKY8bgtUWk4ICRhQiqExvu8rCSRB5gG+qMVo2G/0LSAVthkWDSkAY7VSu45hx6S9co+YC9S+bpvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822866; c=relaxed/simple;
	bh=ca/nt2V5qaX2dfFGVwQ22EiAMlsLfoTg3NdMS8YcHFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=J5VQz7HnuZpvETysQ3beOVlI+LDiKDyPR2jx9QOH8Hqa8rpKeoUCY6QBnq3T+lvLPSgzCQkuqtCAdKYLm0jI2AE9T1KildZ9DbsG5OFfvZeBRugygtfcZw9spRK4TttAmYxvNGOenMj6LibaIIgcysg23m6FSVpgWnsB+SIPiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WfzIaxja; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WfzIaxja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712822864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LHkEhkC59rSd4+t3EPgjeW61RKMZNWhL6bQeRFcAJo=;
	b=WfzIaxjaval6Q9e03EHiugVQ9g4XxnglybWiOMw+9zBysZFj9YuzWHZJ+MIolPXg5PIczl
	2t2kSgBi9i+8Ka03QUeqVYptzKwPzqBZFlXkOgz/VedfCGqDiQ4iPH0YK8FAB37saiL6eJ
	hKSN1EulL4q6J74RovWYtvdvE14kiG8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-ZiOPhE-kM2e92CpHVFCwYA-1; Thu, 11 Apr 2024 04:07:37 -0400
X-MC-Unique: ZiOPhE-kM2e92CpHVFCwYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32AB288B3C4;
	Thu, 11 Apr 2024 08:07:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.204])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9300DC28102;
	Thu, 11 Apr 2024 08:07:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 63290180063D; Thu, 11 Apr 2024 10:07:31 +0200 (CEST)
Date: Thu, 11 Apr 2024 10:07:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: devel@edk2.groups.io, jiewen.yao@intel.com, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
	James Bottomley <jejb@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, qinkun Bao <qinkun@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Peter Gonda <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>, 
	"Xiang, Qinglan" <qinglan.xiang@intel.com>
Subject: Re: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
Message-ID: <dd6vsgt7aayspdhzkqrjsthuiexig4apvhc4ikoeewx62iqmva@rajndsnzoppq>
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki>
 <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,
 
> Given that RTMR is a proper subset of vTPM (modulo the PCR/RTMR index
> conversion), I feel that it should be the CoCo firmware's
> responsibility to either:
> - expose RTMR and not vTPM
> - expose vTPM, and duplicate each measurement into RTMR as they are taken

That approach looks good to me.  It will make sure vTPM and RTMR
measurements are consistent and it also solves the event log issue
(we don't need separate vTPM and RTMR entries then).

take care,
  Gerd

